#!/bin/bash
echo "🔁 Initializing dev environment..."
dotnet tool restore || echo "dotnet tool restore failed or skipped."
echo "✅ Done initializing."
