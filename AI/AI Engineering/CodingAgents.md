# AI Coding Agents

- Agentic IDE:
    - Cursor: An **IDE**, forked from VS code which has an agent in it. 
    - Windsurf    
- Terminal Agent: 
    - Aider: You can connect it to a model like Gemini, OpenAI, Clause with an API key.
        - You have to create API key in Google AI studio. 
    - Claude Code
- Copilot: An extention on VS code.

## Tips (Notes to myself)

- For start:
    - Ask them to explain you the structure of whole project. 
    - Ask them what are the gaps between current code and their expected purpose.
- Coding agents overlook the global conventions in the project.
- They do a lot of unnecessary stuff on their own and unnecessary stuff means more token and as a result more cost! You have to control it.
    - For example they write a feature and then they write a whole script just to test it! In this place you can tell them not to test.
- They do a lot of unnecessary coding which makes your code ugly. Control it. 
