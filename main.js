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

const level1Arr = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 2, 2, 2, 2, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 0, 2, 0, 0, 0],[0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 0, 0],[0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
let currentlvlarray = level1Arr
let health = 40
let maxHealth = 40

let drawBoard = () => {
    
    const container = document.getElementById('container');
    container.innerHTML = ""
    let i = 0
    let k = 0
    while(i < currentlvlarray.length) {
        let j = 0
        while(j < currentlvlarray[0].length){
            if (!document.getElementById(`div${k}`)) {
                const ele = document.createElement("div");
                ele.setAttribute("id", `div${k}`);
                if(col_position === j && row_position === i){
                    ele.setAttribute("class", "tile")
                    container.appendChild(ele);
                    document.getElementById("div" + k).innerHTML = "<img src=img/ship_big_water_ripple.gif height = 50px width= 50px>"
                }  
                else if(level1Arr[i][j] === water) {
                    ele.setAttribute("class", "tile")
                    container.appendChild(ele);
                    document.getElementById(`div${k}`).innerHTML = "<img src=img/water.jpg height = 50px width = 50px>"
                } else if(level1Arr[i][j] === island) {
                    ele.setAttribute("class", "tile")
                    container.appendChild(ele);
                    document.getElementById(`div${k}`).innerHTML = "<img src=img/GrassIsland.png height = 50px width = 50px>"
                } 
            }
            j++
            k++
        }
        i++
    }
    if (!document.getElementById(`div${k}`)){
        const ele = document.createElement("div");
        ele.setAttribute("id", `div${k}`)
        ele.setAttribute("class", "heathBar")
        container.appendChild(ele)
        document.getElementById(`div${k}`).innerHTML = `<img src=img/corazon.png height = 50px  width = 50px>${health}/${maxHealth}`
    }
}
let moveLeft = () => {    
    if(col_position > 0 && currentlvlarray[row_position][col_position-1] != island) {
        col_position--
        drawBoard()
    }    
}
let moveDown = () => {
    if (row_position < currentlvlarray.length - 1 && currentlvlarray[row_position + 1][col_position] != island){
        row_position++
        drawBoard()
    }
}
let moveRight = () => {
    if(col_position < currentlvlarray[0].length - 1 && currentlvlarray[row_position][col_position + 1] != island) {
        col_position++
        drawBoard()
    }
}
let moveUp = () => {
    if (row_position > 0 && currentlvlarray[row_position - 1][col_position] != island){
        row_position--
        drawBoard()
    }
}
async function sharkMovement(){
    
    while(true){
        setTimeout(() => {}, 4000)
        console.log("hello")
        if(counter > 20){
            counter = 0
        }
        if(counter >= 0 && counter < 5){ 
            shark_y++
        }
        if(counter >= 5 && counter < 10){
            shark_x++
        }
        if(counter >= 10 && counter < 15){
            shark_y--
        }
        if(counter >= 15 && counter < 20){
            $shark_x--
        }
        drawBoard()
    }
}
let sharkDamage = () => {
    health -= Math.floor(Math.random()*4)
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
    }    
});



window.onload = drawBoard() 


