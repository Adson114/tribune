//changeInfo
function append() {
    window.location.href="toSetInfo";
};

function updateUser(id) {
    $.ajax({
        type:"POST",
        url:"/updateUser",
        data:{
            "uId":$("#uId").val().trim(),
            "uName":$("#uName").val().trim(),
            "uPassword":$("#uPassword").val().trim(),
            "uEmail":$("#uEmail").val().trim(),
            "uMobile":$("#uMobile").val().trim(),
            "uSex":$("#uSex").val().trim()
        },
        async:true,
        success:function () {
            window.location.reload(true);
        }
    }) ;
};

//changePerson
function remove(id){
    $.ajax({
        type:"POST",
        url:"/removeTopic",
        data:{
            "id":id
        },
        success:function () {
            window.location.reload(true);
        }
    });
};

function removeReply(id) {
    $.ajax({
        type:"POST",
        url:"/removeReply",
        data:{
            "id":id
        },
        success:function () {
            window.location.reload(true);
        }
    });
};

//detailedPost
function insertReply() {
    $.ajax({
        type: "POST",
        url: "/insertReply",
        data: {
            "area": $("#textArea").val().trim(),
            "id": $("#id").val().trim()
        },
        async: true,
        success: function (data) {
            window.location.reload(true);
        }
    });
}

//register

//send
function returnMain(){
    window.location.href="/allView";
};

function verify() {
    var comment=document.getElementById("area").val();
    if(comment==""||comment==null){
        $("#contentP").html("不能为空");
        return false;
    }
}

//setInfo
function updateDec(id) {
    $.ajax({
        type: "POST",
        url:"/updateDec",
        data:{
            "uId": $("#uId").val().trim(),
            "decText":$("#textB").val().trim()
        },
        async: true,
        success:function () {
            window.location.href = "toChangeInfo";
        }
    });
};


//side

