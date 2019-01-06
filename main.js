let drawBoard = (currentlvlarray) => {
    const container = document.getElementById('container');
    let i = 0
    let k = 0
    while(i < currentlvlarray.length) {
        let j = 0
        while(j < currentlvlarray[0].length){
            if (!document.getElementById(`div${k}`)) {
                const ele = document.createElement("div");
                ele.setAttribute("id", `div${k}`);
                if(level1Arr[i][j] === 0) {
                    ele.setAttribute("class", "water")
                    container.appendChild(ele);
                    document.getElementById(`div${k}`).innerHTML = "<img src=img/water.jpg height = 20 width = 20>"
                } else if(level1Arr[i][j] === 1){
                    ele.setAttribute("class", "boat")
                    container.appendChild(ele);
                    document.getElementById("div" + k).innerHTML = "<img src=img/ship_big_water_ripple.gif height = 20 width = 20>"
                }                
            }
            j++
            k++
        }
        i++
    }
}

let level1Arr = [[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 1, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0]]

window.onload = drawBoard(level1Arr)


