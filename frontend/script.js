const apiUrl = "http://BACKEND_ALB_DNS/api";

function loadMessages() {

fetch(`${apiUrl}/get_messages.php`)
.then(response => response.json())
.then(data => {

const list = document.getElementById("messages");
list.innerHTML = "";

data.forEach(msg => {
const li = document.createElement("li");
li.textContent = msg.message;
list.appendChild(li);
});

});

}

function sendMessage(){

const message = document.getElementById("message").value;

fetch(`${apiUrl}/save_message.php`,{

method:"POST",
headers:{"Content-Type":"application/json"},
body:JSON.stringify({message:message})

}).then(()=>loadMessages());

}

loadMessages();