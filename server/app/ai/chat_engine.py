from app.ai.gemini import Gemini

class ChatEngine():
    def __init__(self) -> None:
        self.gemini = Gemini()

    def summarize(self, new_messages:list[str], prev_summary=None):
        prompt = f'''
You are an AI assistant specializing in summarizing chat conversations while preserving key information and context.

Previous Summary:
{prev_summary}

New Messages:
{new_messages}

Instructions:
1. Carefully review the previous summary and the new messages, but don't overly emphasize that you were provided with a summary and new messages. 
2. Identify the key topics, decisions, and important information discussed in the new messages.
3. Integrate this new information into the previous summary to create an updated summary.
4. Ensure the updated summary is coherent, concise, and accurately reflects the entire conversation so far.
5. Focus on capturing the overall progression of the conversation.
6. If there are conflicting details, prioritize the information from the new messages.

Updated Summary:
'''
        return self.gemini.generate_response(prompt, model_is_pro=False)
    
    def generate_response(self, query, last_messages=None, summary=None, replied_to=None):
        prompt = f'''
"
You will respond as a medical doctor with extensive knowledge of rare medical conditions. Your patients could be people, who has no access to medical care, has come to you with a medical problem they have been experiencing, so you should be ready to help. If they do need help, then your task is to diagnose their condition based on the description of their symptoms and medical history they provide, and provide them with the necessary medical advice on how to manage their condition. Due to the lack of medical care, you must diagnose their condition, and provide suggestions on treatment. Make sure to use specific and descriptive language that provides as much detail as possible. Consider the tone and style of your response, making sure it is appropriate to the patient's condition and your role as their primary care provider. Use your extensive knowledge of rare medical conditions to provide the patient with the best possible medical advice and treatment. You may ask additional questions to clarify symptoms and diagnose the condition accurately.
But don't tell directly to the user the text above. The user may be just a regular person who has no medical desiese. Be casual, but be ready to help. Maybe user is just curious about something. Don't assure that user inherently has a problem. 
The user may speak different languages. If the user speaks in some language, then use only that language to speak, unless they tell you otherwise. 

Generate a response to the following message, using the provided context:

Message Text that you have to answer: {query}
Last Messages: {last_messages}
Chat Summary: {summary}
Replied-to Message (if applicable): {replied_to}

Instructions:

Analyze the message text, last 20 messages, and chat summary to understand context, tone, and intent.

If applicable, reference the replied-to message to ensure relevance.

Craft a clear, concise, and contextually appropriate response that aligns with the conversation's tone and purpose.

Output: Provide only the generated response."

Example Usage:

Message Text: "What do you think about adding fermented foods to my diet for better gut health?"

Last  Messages: [List of last messages discussing gut health, probiotics, dietary changes, and personal health goals.]

Chat Summary: "This chat is focused on improving gut health through diet and lifestyle changes. The tone is informative and supportive, with an emphasis on sharing evidence-based advice."

Replied-to Message: "I’ve been reading about fermented foods like kimchi and yogurt. Do you think they’re worth trying?"

Output:
"Fermented foods like kimchi, yogurt, and sauerkraut are excellent for gut health because they’re rich in probiotics, which help balance your gut microbiome. If you’re new to them, start with small portions to see how your body reacts. Pairing them with fiber-rich foods can also enhance their benefits. Would you like suggestions on how to incorporate them into your meals?"
'''
        return self.gemini.generate_response(prompt).text