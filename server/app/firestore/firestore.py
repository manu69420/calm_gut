import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore as firestore_admin
from google.cloud import firestore as firestore_cloud

from dotenv import load_dotenv
import pathlib

from app.constants import *
from app.models import Message, Chat

basedir = pathlib.Path(__file__).parents[2]
load_dotenv(basedir / ".env")


cred = credentials.Certificate("calm-gut-firebase-adminsdk-fbsvc-35236eb7be.json")
app = firebase_admin.initialize_app(cred)
db = firestore_admin.client()

firestore_cloud.SERVER_TIMESTAMP

class Firestore():
    def __init__(self, chat_id) -> None:
        self.chat = db.collection(chats_collection).document(chat_id)
        self.messages = self.chat.collection(messages_collection)

    def send_message(self, text:str) -> None:
        '''Creates a message document in Firestore'''

        message = Message(
                author_id="bot_id", 
                text=text,
                created_at=firestore_cloud.SERVER_TIMESTAMP
            )
        self.messages.document().set(message.to_dict())
        
        self.update_messages_count(1 + self.messages_count())
        
    def update_summary(self, new_summary:str):
        self.chat.update({"summary": new_summary})

    def last_n_messages(self, n:int) -> list:
        '''Fetches last [n] messages from the chat'''
        messages = self.chat.collection(messages_collection)
        docs = messages.order_by(created_at_field, direction=firestore_cloud.Query.DESCENDING).limit(n).stream()

        return [doc.to_dict() for doc in docs]
    
    def get_summary(self) -> str:
        try:
            chat = self.chat.get()
            return chat.to_dict().get("summary")
        except:
            return "No summary"
    
    def messages_count(self):
        try:
            chat = self.chat.get()
            return int(chat.to_dict().get("message_count"))
        except:
            return 0
    
    def update_messages_count(self, messages_count:int):
        self.chat.update({"message_count": messages_count})

    def delete_collection(self, coll_ref, batch_size):
        if batch_size == 0:
            return

        docs = coll_ref.list_documents(page_size=batch_size)
        deleted = 0

        for doc in docs:
            print(f"Deleting doc {doc.id} => {doc.get().to_dict()}")
            doc.delete()
            deleted = deleted + 1

        if deleted >= batch_size:
            return self.delete_collection(coll_ref, batch_size)