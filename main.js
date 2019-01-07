const island = 2
const boat = 1
const water = 0
const shark = 3
let row_position = 0
let col_position = 7
const level1Arr = [[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0]]
let currentlvlarray = level1Arr

let drawBoard = () => {
    console.log("drawing")
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
                    ele.setAttribute("class", "boat")
                    container.appendChild(ele);
                    document.getElementById("div" + k).innerHTML = "<img src=img/ship_big_water_ripple.gif height = 20 width = 20>"
                }  
                else if(level1Arr[i][j] === water) {
                    ele.setAttribute("class", "water")
                    container.appendChild(ele);
                    document.getElementById(`div${k}`).innerHTML = "<img src=img/water.jpg height = 20 width = 20>"
                }            
            }
            j++
            k++
        }
        i++
    }
}
let moveLeft = () => {    
    if(col_position > 0 && currentlvlarray[row_position][col_position-1] != island) {
        col_position--
        drawBoard()
    }    
}
let moveDown = () => {
    if (row_position < 7 && currentlvlarray[row_position + 1][col_position] != island){
        row_position++
    }
}
let moveRight = () => {
    console.log("right")
}
let moveUp = () => {
    console.log("up")
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



window.onload = drawBoard(level1Arr)


