document.addEventListener("DOMContentLoaded", () => {
    const toggle = document.getElementById("chatToggle");
    const panel = document.getElementById("chatPanel");
    const closeBtn = document.getElementById("chatClose");
    const form = document.getElementById("chatForm");
    const input = document.getElementById("chatInput");
    const messages = document.getElementById("chatMessages");

    if (!toggle || !panel) return;

    toggle.addEventListener("click", () => panel.classList.toggle("hidden"));
    if (closeBtn) closeBtn.addEventListener("click", () => panel.classList.add("hidden"));

    // Initial greeting if empty
    if (messages && messages.children.length === 0) {
        appendMessage("bot", "Hello! Welcome to JAIMART Assistant. Ask me anything about orders, shipping, returns, or products!");
    }

    if (form) {
        form.addEventListener("submit", (e) => {
            e.preventDefault();
            const text = input.value.trim();
            if (!text) return;
            appendMessage("user", text);
            input.value = "";

            setTimeout(() => {
                const reply = window.Store ? window.Store.getChatReply(text) : "How can I help you today?";
                appendMessage("bot", reply);
            }, 300);
        });
    }

    function appendMessage(who, text) {
        const div = document.createElement("div");
        div.className = "chat-msg " + who;
        div.textContent = text;
        messages.appendChild(div);
        messages.scrollTop = messages.scrollHeight;
    }
});
