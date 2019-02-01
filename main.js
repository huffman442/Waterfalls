const island = 2
const boat = 1
const water = 0
const shark = 3
const waterfall = 4
let row_position = 0
let col_position = 7
let shark_x = 5
let shark_y = 3
let counter = 0
let moneyAmt = 0
const level1Arr = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 4, 2, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
const level2Arr = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],[0, 0, 0, 0, 0, 2, 0, 2, 0, 0, 0, 0],[0, 0, 0, 0, 2, 2, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
let currentlvlarray = level1Arr
let health = 10
let maxHealth = 10
let message = "Water is all around!"

let drawBoard = () => {
    
    const container = document.getElementById('container');
    container.innerHTML = ""
    let k = 0
    for(let i = 0;i < currentlvlarray.length; i++) {
        for(let j = 0; j < currentlvlarray[0].length; j++){
            if (!document.getElementById(`div${k}`)) {
                const ele = document.createElement("div");
                ele.setAttribute("id", `div${k}`);
                if(col_position === j && row_position === i){
                    ele.setAttribute("class", "tile")
                    container.appendChild(ele);
                    document.getElementById("div" + k).innerHTML = "<img src=img/ship_big_water_ripple.gif height = 30px width= 30px>"
                } else if(shark_x === i && shark_y === j) {
                    ele.setAttribute("class", "tile")
                    container.appendChild(ele);
                    document.getElementById("div" + k).innerHTML = "<img src=img/shark_001_64px.gif height = 30px width= 30px>"

                }else {
                    if(currentlvlarray[i][j] === water) {
                        ele.setAttribute("class", "tile")
                        container.appendChild(ele);
                        document.getElementById(`div${k}`).innerHTML = "<img src=img/water.jpg height = 30px width = 30px>"
                    } else if(currentlvlarray[i][j] === island) {
                        ele.setAttribute("class", "tile")
                        container.appendChild(ele);
                        document.getElementById(`div${k}`).innerHTML = "<img src=img/GrassIsland.png height = 30px width = 30px>"
                    } else if(currentlvlarray[i][j] === waterfall) {
                        ele.setAttribute("class", "tile")
                        container.appendChild(ele);
                        document.getElementById(`div${k}`).innerHTML = "<img src=img/waterfall.png height = 30px width = 30px>"
                    } 
                }
            }
            k++
        }
    }
    if (!document.getElementById(`div${k}`)){
        const ele = document.createElement("div");
        ele.setAttribute("id", `div${k}`)
        ele.setAttribute("class", "heathBar")
        container.appendChild(ele)
        document.getElementById(`div${k}`).innerHTML = `<img src=img/corazon.png height = 50px  width = 50px>${health}/${maxHealth}`
    }
    k++
    if (!document.getElementById(`div${k}`)){
        const ele = document.createElement("div");
        ele.setAttribute("id", `div${k}`)
        ele.setAttribute("class", "heathBar")
        container.appendChild(ele)
        document.getElementById(`div${k}`).innerHTML = `<img src=img/Golden.png height = 50px  width = 50px>${moneyAmt}`
    }
    k++
    if (!document.getElementById(`div${k}`)){
        const ele = document.createElement("div");
        ele.setAttribute("id", `div${k}`)
        ele.setAttribute("class", "")
        container.appendChild(ele)
        document.getElementById(`div${k}`).innerHTML = `${message}   ${shark_x} ${shark_y}`
    }
}
let moveLeft = () => {    
    if(col_position > 0 && currentlvlarray[row_position][col_position-1] != island) {
        col_position--
        if(currentlvlarray[row_position][col_position] === waterfall){
            currentlvlarray[row_position][col_position] = 0
            message = "You found a waterfall!"
        } else {
            message = "Water is all around"
        }
  
        drawBoard()
    }    
}
let moveDown = () => {
    if (row_position < currentlvlarray.length - 1 && currentlvlarray[row_position + 1][col_position] != island){
        row_position++
        if(currentlvlarray[row_position][col_position] === waterfall){
            currentlvlarray[row_position][col_position] = 0
            message = "You found a waterfall!"
        } else {
            message = "Water is all around"
        }
        //sharkMovement()
        drawBoard()
    }
}
let moveRight = () => {
    if(col_position < currentlvlarray[0].length - 1 && currentlvlarray[row_position][col_position + 1] != island) {
        col_position++
        if(currentlvlarray[row_position][col_position] === waterfall){
            currentlvlarray[row_position][col_position] = 0
            message = "You found a waterfall!"
        } else {
            message = "Water is all around"
        }
        //sharkMovement()
        drawBoard()
    }
}
let moveUp = () => {
    if (row_position > 0 && currentlvlarray[row_position - 1][col_position] != island){
        row_position--
        if(currentlvlarray[row_position][col_position] === waterfall){
            currentlvlarray[row_position][col_position] = 0
            message = "You found a waterfall!"
        } else {
            message = "Water is all around"
        }
        //sharkMovement()
        drawBoard()
    }
}
function sharkMovement() {
    
        //
    
    console.log(counter)
    if(counter >= 20){
        counter = 0
    }
    if(counter >= 0 && counter < 5){ 
        shark_y++
        counter++
    }
    if(counter >= 5 && counter < 10){
        shark_x++
        counter++
    }
    if(counter >= 10 && counter < 15){
        shark_y--
        counter++
    }
    if(counter >= 15 && counter < 20){
        shark_x--
        counter++
    }
    if(shark_x === row_position && shark_y === col_position){
        sharkDamage()        
    }

    if(health > 0) {
        drawBoard()
    }
    
    
    //setTimeout(() => {drawBoard()}, 4000)

    
}
let sharkDamage = () => {
    health -= Math.floor(Math.random()*3 + 1)
    if(health <= 0){
        console.log("game should be over")
        gameOver()
    }
}
let gameOver = () => {
    console.log('game should end now!')
    const container = document.getElementById('container');
    container.innerHTML = ""
    container.innerHTML = "<img src = img/game-over.png height = 500px width = 360px><div> Press r to restart</div>"
}

document.addEventListener("keypress", function onEvent(event) {
    if (event.key === "a"){
        moveLeft()
    } else if (event.key === "w"){
        moveUp()
    } else if (event.key === "s" ){
        moveDown()
    } else if (event.key === "d"){
        moveRight()
    } else if (event.key === "r" && health < 0){
        window.location.reload(true);
    } 
});

let startUp = () => {
    drawBoard();
    setInterval(function () {sharkMovement()}, 500);    
}

window.onload = startUp()


