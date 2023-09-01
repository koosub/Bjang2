/* 셀렉트 박스 옆에 DIV 추가하기 */

//셀렉트 박스 가져오기
let selectBox = document.getElementsByTagName('SELECT');

for(let i=0; i<selectBox.length; i++){

    //감싸는 div 생성
    let mySelect = document.createElement('DIV');
    mySelect.classList.add('mySelect');
    //보이는 부분 생성
    let selec = document.createElement('DIV');
    selec.classList.add('selec');
    //UL 생성
    let ul_select = document.createElement('UL');
    ul_select.classList.add('ul_select');
    
    //option for 문으로 돌려서 추가
    let thisOpt = selectBox[i].getElementsByTagName('option');
    selec.tabIndex = 0;
    selec.innerHTML = thisOpt[0].innerHTML;
    for(let x=0; x<thisOpt.length; x++){
        let makeLI = document.createElement('LI');
        makeLI.innerHTML = thisOpt[x].innerHTML;
        makeLI.tabIndex = 0;
        ul_select.appendChild(makeLI);
    }//for

    //mySelect에 붙여주기
    mySelect.appendChild(selec);
    mySelect.appendChild(ul_select);

    //mySelect 추가하기
    selectBox[i].parentElement.appendChild(mySelect);
}//for


/* 커스텀 셀렉트 박스 - selec 선택하면 ul_select보이게끔 */
let selec = document.getElementsByClassName('selec');

for(let i=0; i<selec.length; i++){
    selec[i].addEventListener('click',function(){
        this.nextElementSibling.classList.toggle('on');
    });
}//for


/* LI를 선택하면 클래스가 지정되고, 이전 형제 select에도 지정이 된다네 */
let ul_select = document.getElementsByClassName('ul_select');

for(let i=0; i<ul_select.length; i++){
    let allLI = ul_select[i].getElementsByTagName('LI');
    for(let x=0; x<allLI.length; x++){
        allLI[x].addEventListener('click',function(){
            //인덱스 가져옴
            let thisIndex = Array.prototype.indexOf.call(allLI, this); //console.log(thisIndex);
            //형제들 클래스 제거
            for(let y=0; y<allLI.length; y++){allLI[y].classList.remove('on');}
            //본인 클래스 추가
            this.classList.add('on');
            //selec의 innerHTML 변경
            this.parentElement.previousElementSibling.innerHTML = this.innerHTML;
            this.parentElement.previousElementSibling.focus();
            //ul_select 숨기기
            this.parentElement.classList.remove('on');
            //이전 형제의 option을 선택하도록 넘겨준다
            this.parentElement.parentElement.previousElementSibling.getElementsByTagName('option')[thisIndex].selected = true;
        });
    }//for
}//for