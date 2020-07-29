// JS file was required at bottom of HTML file so no need for DOMContentLoaded
const BASE_URL = "http://localhost:3000"
const TASKS_URL = `${BASE_URL}/tasks`
const USERS_URL = `${BASE_URL}/users`
const FAVORITES_URL = `${BASE_URL}/favorites`
const taskCollection = document.querySelector('#gift-collection')
const favCollection = document.querySelector('#fav-collection')
const likeButton = document.querySelector('.like-btn')
const signupForm = document.querySelector('#signup-form')
const signupInputs = document.querySelectorAll(".signup-input")
const header = document.querySelector('.header-banner')
const logout = document.querySelector('.logout')
let currentUser

class Task {
    constructor(taskAttributes) {
        this.title = taskAttributes.title;
        this.category = taskAttributes.category;
        this.description = taskAttributes.description;
        this.link = taskAttributes.link;
        this.image = taskAttributes.image;
        this.id = taskAttributes.id;
    }

    render() {
        return `<div class="card">
                  <h2>${this.title}</h2>
                  <h4 class="gift-cat">${this.category}</h4>
                  <a href=${this.link} target="_blank"><img src=${this.image} class="gift-image" /></a>
                  <p>${this.description}<p>
                  <button data-gift-id=${this.id} class="like-btn">♡</button>
                </div>`
    }
}

function putTasksOnDom(taskArray){
    taskCollection.innerHTML = `<h2 class="subheader">All Tasks</h2>
                                <h4 class="favorites-link">View My Finished Tasks ♡</h4>`
    taskArray.forEach(task => {
        taskCollection.innerHTML += new Task(task).render()

        // `<div class="card">
        //   <h2>${task.title} ($${task.price})</h2>
        //   <h4 class="task-cat">${task.category}</h4>
        //   <a href=${task.link} target="_blank"><img src=${task.image} class="gift-image" /></a>
        //   <p>${task.description}<p>
        //   <button data-tgift-id=${task.id} class="like-btn">♡</button>
        // </div>`
    })
}

function putFavoritesOnDom(favArray){
    favCollection.innerHTML = `<h2 class="subheader">My Favorites</h2>
                               <h4 class="back-link">←Back to Tasks</h4>`
    favArray.forEach(favorite => {
        favCollection.innerHTML += `<div class="card">
          <h2>${favorite.task.title} ($${favorite.task})</h2>
          <h4 class="gift-cat">${favorite.task.category}</h4>
          <a href=${favorite.task.link} target="_blank"><img src=${favorite.task.image} class="gift-image" /></a>
          <p>${favorite.task.description}<p>
          <button data-gift-id=${favorite.task.id} class="like-btn" style="color:red;">♡</button>
        </div>`
    })
}

function fetchTasks(){
    fetch(TASKS_URL)
    .then(res => res.json())
    .then(tasks => putTasksOnDom(tasks))
}

function fetchFavorites(){
    fetch(BASE_URL + '/users/' + currentUser.id + '/favorites')
    .then(res => res.json())
    .then(favorites => putFavoritesOnDom(favorites))
} 

signupForm.addEventListener('submit', function(e){
    e.preventDefault()
    fetch(USERS_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            Accept: "application/json"
        },
        body: JSON.stringify({
            user: {
                email: signupInputs[0].value,
                password: signupInputs[1].value
            }
        })
    })
    .then(res => res.json())
    .then(function(object){
        if (object.message) {
            alert(object.message)
        }
        else {
        loggedInUser(object)
        }
    }
    )
})

taskCollection.addEventListener('click', function(e) {
    if (event.target.className == "favorites-link") {
        taskCollection.style.display = 'none';
        fetchFavorites();
        favCollection.style.display = 'initial';
    }
})

favCollection.addEventListener('click', function(e) {
    if (event.target.className == "back-link") {
        favCollection.style.display = 'none';
        taskCollection.style.display = 'initial';
    }
})

function loggedInUser(object){
    currentUser = object
    signupForm.style.display = 'none'
    welcome.innerHTML = `<h3>Hello, <i>${currentUser.email}</i> !</h3>`
    logout.innerText = "Logout"
    fetchTasks()
}

taskCollection.addEventListener('click', function(e){
    // console.log(event.target.className, event.target.style.color)
    // e.preventDefault() was preventing images from being clickable
    if ((event.target.className == "like-btn") && (event.target.style.color !== 'red')) {
        let target = event.target
            fetch(FAVORITES_URL, {
                method: "POST",
                headers: {
                    "Content-Type": "application/json",
                    Accept: "application/json"
                },
                body: JSON.stringify({
                        user_id: `${currentUser.id}`,
                        task_id: `${event.target.dataset.taskId}`
                })
        })
        .then( res => res.json())
        .then( res => target.dataset.favId = res.id);
        event.target.style.color = 'red';}
    else if ((event.target.className == "like-btn") && (event.target.style.color == 'red')) {
        event.target.style.color = 'black';
        fetch(FAVORITES_URL + '/' + event.target.dataset.favId, {
            method: "DELETE"
        })
    }
})
