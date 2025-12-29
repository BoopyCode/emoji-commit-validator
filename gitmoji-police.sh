#!/bin/bash
# Gitmoji Police - Because your commit history shouldn't look like a teenager's text messages
# Officer Friendly is here to restore order to your chaotic emoji usage

# The Official Gitmoji Code (simplified for your protection)
VALID_EMOJIS=(
    "✨" "🎨" "🐛" "🚑️" "📝" "🚀" "💄" "🎉" "🔒️" "🔖"
    "🚨" "🚧" "💚" "⬇️" "⬆️" "📌" "👷" "📈" "♻️" "➕"
    "➖" "🔧" "🌐" "✏️" "💩" "⏪️" "🔀" "📦️" "👽️" "🚚"
    "📄" "💥" "🍱" "♿️" "💡" "🍻" "💬" "🗃️" "🔊" "🔇"
    "👥" "🚸" "🏗️" "📱" "🤡" "🥚" "🙈" "📸" "⚗️" "🔍️"
    "🏷️" "🌱" "🚩" "🥅" "💸" "🧪" "👔" "🩺" "🧱" "🧑‍💻"
)

# Check if we're in a git repo (spoiler: you probably aren't)
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "🚨 ALERT: No git repository found. Are you lost, citizen?"
    exit 1
fi

# Get the last commit message
COMMIT_MSG=$(git log -1 --pretty=%B)

# Extract first character (emoji detection 101)
FIRST_CHAR="${COMMIT_MSG:0:1}"

# Check if it's even an emoji (not a letter, you rebel)
if [[ "$FIRST_CHAR" =~ [a-zA-Z0-9] ]]; then
    echo "🚨 CITATION: No leading emoji detected. That's a paddlin'."
    echo "Last commit: $COMMIT_MSG"
    exit 1
fi

# Check if it's a valid gitmoji
VALID=false
for emoji in "${VALID_EMOJIS[@]}"; do
    if [[ "$FIRST_CHAR" == "$emoji" ]]; then
        VALID=true
        break
    fi
done

if [[ "$VALID" == false ]]; then
    echo "🚨 FELONY: Unauthorized emoji usage detected!"
    echo "Offending emoji: $FIRST_CHAR"
    echo "Last commit: $COMMIT_MSG"
    echo ""
    echo "💡 Tip: Stick to approved gitmojis. We're professionals here."
    exit 1
fi

# All clear! You may proceed with your orderly development.
echo "✅ All good, citizen. Your emoji usage is... acceptable."
exit 0
