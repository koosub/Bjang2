
//snb 접기 효과
$(".btn-snbControl").click(function(){
    $(this).toggleClass("folded");

    $(".whole-container").toggleClass("wide");
    $(".side-bar").toggleClass("folded");
});


//셀렉박스 효과
$(".btn-select").click(function(){
    $(".btn-select").not(this).removeClass("on");
    $(this).toggleClass("on");
});

$(".option__list-item").click(function(){
    var selected = $(this).children("button").text();
    $(".btn-select").removeClass("on");
});

