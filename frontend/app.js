const API_URL = "http://BACKEND_ALB_DNS";

function loadNotes(){

fetch(`${API_URL}/fetch_notes.php`)
.then(res => res.json())
.then(data => {

const list = document.getElementById("noteList");
list.innerHTML="";

data.forEach(note=>{
const li=document.createElement("li");
li.textContent = note.note;
list.appendChild(li);
});

});

}

function addNote(){

const note=document.getElementById("noteInput").value;

fetch(`${API_URL}/add_note.php`,{

method:"POST",
headers:{"Content-Type":"application/json"},
body:JSON.stringify({note:note})

}).then(()=>{

document.getElementById("noteInput").value="";
loadNotes();

});

}

loadNotes();
