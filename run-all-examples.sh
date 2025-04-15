#!/bin/bash
echo "🚀 Running all sample projects..."

echo -e "\n➡️ Running C#"
cd .devcontainer/examples/csharp-hello
dotnet run

echo -e "\n➡️ Running Python"
cd ../python-hello
python3 hello.py

echo -e "\n➡️ Running Node.js"
cd ../node-hello
npm install
npm start

echo -e "\n➡️ Running PowerShell"
cd ../powershell-hello
pwsh ./hello.ps1

echo -e "\n✅ All examples executed."
