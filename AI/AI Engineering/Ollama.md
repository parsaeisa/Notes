# Ollama

Easier deployment for models.

Running Ollama with Docker:
```bash
docker run -d -v ollama:/root/.ollama -p 11434:11434 --name ollama ollama/ollama
```

Go into the container and run:
```bash
ollama run qwen2.5vl:3b
```
* Don't run `qwen2.5vl` or for example `qwen2.5vl:32b`, because then it could be stronger than your machines power.

Then you should see a **dialogue box** in the terminal. Press **Ctrl + D** in the terminal, but don't worry, the model keeps responding in the port. 

Install the library:
```bash
pip install ollama
```

Then write this python code to give questions and answers to the model:
```python
import ollama

client = ollama.Client(host="ollama-host-address")

image_path = "path/to/your/image.jpg"
question_text = "What is the hairstyle in this image called?"

response = client.chat(
    model="qwen2-vl:3b",
    messages=[
        {
            "role": "user",
            "content": question_text,
            "images": [image_path]  # مسیر فایل عکس به صورت لیست
        }
    ]
)

# چاپ پاسخ خروجی مدل (Baseline بدون گراف دانش)
baseline_answer = response["message"]["content"]
print("Model Output (Baseline):")
print(baseline_answer)
```