<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Command Line Interface</title>
  <style>
    body {
      background-color: #1e1e1e;
      color: #00ff00;
      font-family: 'Courier New', Courier, monospace;
      padding: 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }
    h2 {
      color: #00ff00;
      text-shadow: 0px 0px 5px #00ff00;
    }
    .console {
      width: 80%;
      max-width: 800px;
      height: 400px;
      overflow-y: auto;
      background-color: #2e2e2e;
      padding: 15px;
      border-radius: 8px;
      border: 1px solid #444;
      box-shadow: 0px 0px 15px rgba(0, 255, 0, 0.2);
    }
    #inputLine {
      display: flex;
      align-items: center;
      margin-top: 10px;
      width: 80%;
      max-width: 800px;
    }
    #inputLine > span {
      margin-right: 5px;
      color: #00ff00;
    }
    #commandInput {
      flex-grow: 1;
      border: none;
      background: none;
      color: #00ff00;
      outline: none;
      font-size: 1em;
    }
    /* Customize the scrollbar */
    .console::-webkit-scrollbar {
      width: 8px;
    }
    .console::-webkit-scrollbar-track {
      background: #1e1e1e;
    }
    .console::-webkit-scrollbar-thumb {
      background: #00ff00;
      border-radius: 5px;
    }
    .console::-webkit-scrollbar-thumb:hover {
      background: #33ff33;
    }
    /* Command output styling */
    .console p {
      margin: 0;
      padding: 2px 0;
      color: #00ff00;
      font-size: 1em;
    }
  </style>
</head>
<body>

  <h2>Simple Command Line Interface</h2>
  <div class="console" id="consoleOutput"></div>
  
  <div id="inputLine">
    <span>&gt;</span>
    <input type="text" id="commandInput" autofocus>
  </div>

  <script>
    const consoleOutput = document.getElementById('consoleOutput');
    const commandInput = document.getElementById('commandInput');

    // Commands with descriptions
    const commands = {
      help: "Available commands: help, about, clear, all",
      about: "This is a simple command line interface built with HTML, CSS, and JavaScript.",
      clear: function() {
        consoleOutput.innerHTML = '';
      },
      all: function() {
        const allCommands = Object.keys(commands)
          .map(cmd => `${cmd} - ${typeof commands[cmd] === "string" ? commands[cmd] : "Executes a function"}`)
          .join("\n");
        appendOutput(allCommands);
      }
    };

    function handleCommand(command) {
      if (command in commands) {
        if (typeof commands[command] === "function") {
          commands[command]();
        } else {
          appendOutput(commands[command]);
        }
      } else {
        appendOutput("Unknown command: " + command);
      }
    }

    function appendOutput(text) {
      const p = document.createElement('p');
      p.textContent = text;
      consoleOutput.appendChild(p);
      consoleOutput.scrollTop = consoleOutput.scrollHeight; // Auto-scroll
    }

    // Listen for Enter key
    commandInput.addEventListener('keypress', function(event) {
      if (event.key === 'Enter') {
        const command = commandInput.value.trim();
        if (command) {
          appendOutput("> " + command); // Show entered command
          handleCommand(command);
          commandInput.value = ''; // Clear input
        }
      }
    });
  </script>

</body>
</html>
