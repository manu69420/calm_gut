import firebase_admin
from firebase_admin import firestore as firestore_admin
from google.cloud import firestore as firestore_cloud
from google.cloud.firestore_v1 import aggregation

from dotenv import load_dotenv
import pathlib

from app.constants import *
from app.models import Message, Chat

basedir = pathlib.Path(__file__).parents[2]
load_dotenv(basedir / ".env")

app = firebase_admin.initialize_app()
db = firestore_admin.client()

firestore_cloud.SERVER_TIMESTAMP

class Firestore():
    def __init__(self, chat_id) -> None:
        self.chat = db.collection(chats_collection).document(chat_id)

    def send_message(self, text:str) -> None:
        '''Creates a message document in Firestore'''
        messages = self.chat.collection(messages_collection)

        message = Message(
                author_id="bot_id", 
                text=text,
                created_at=firestore_cloud.SERVER_TIMESTAMP
            )
        messages.document().set(message.to_dict())
        
        chat = self.chat.get()
        if chat.exists:
            self.chat.update({"message_count": 1 + chat.to_dict()["message_count"]})
        
    def update_summary(self, new_summary:str):
        self.chat.update({"summary": new_summary})

    def last_n_messages(self, n:int) -> list:
        '''Fetches last [n] messages from the chat'''
        messages = self.chat.collection(messages_collection)
        docs = messages.order_by(created_at_field, direction=firestore_cloud.Query.DESCENDING).limit(n).stream()

        return [doc.to_dict() for doc in docs]
    
    def get_summary(self) -> str:
        chat = self.chat.get()
        return chat.to_dict().get("summary")
    
    def messages_count(self):
        chat = self.chat.get()
        return int(chat.to_dict().get("message_count"))
        