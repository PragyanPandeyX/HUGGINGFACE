import psutil
import subprocess
import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def hello_world():
    running = False
    for proc in psutil.process_iter(['pid', 'name', 'cmdline']):
        if 'python' in proc.info['name'] and 'Eval.py' in proc.info['cmdline']: 
            running = True
            break
    if running:
        return 'Bot is Running...'
    else:
        subprocess.Popen(['python3', '-m', 'Eval.py'])
        return 'Bot is Now Alive'

if __name__ == '__main__':
    # Start Flask app in the main thread
    app.run(host="0.0.0.0", port=7860, debug=True)
