/**
 * 
 */
$(function(){
	
	// 리스트 페이지 글쓰기 버튼
	$("#loginAlertBtn").click(function(){
		alert("로그인 후 게시글을 작성하실 수 있습니다.");
	});
	
	$("#writeBtn").click(function(){
		let uid = $("#uid").val();
		location.href = "boardWritePage?uid="+uid;
	});
	
	// 글쓰기 페이지 게시글 등록
	$("#regBtn").click(function(){
		let subject = $("#subject").val().trim();
		
		if(subject==""){
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else{
			$("#writeFrm").attr("action","boardWrite");
			$("#writeFrm").submit();
		}
	});
	
	// 게시글 삭제버튼
	$("button#delBtn").click(function(){
		let chkTF = confirm("게시글을 삭제하시겠습니까?");
		
		if(chkTF){
			let nowPage = $("input#nowPage").val().trim();
			let num = $("input#num").val().trim();
			let p3 = $("#pKeyField").val().trim();
			let p4 = $("#pKeyWord").val().trim();
			
			let url ="boardDelete?";
			url += "num="+num+"&nowPage="+nowPage;
			url += "&keyField="+p3;
			url += "&keyWord="+p4;
			location.href = url;
		}else{
			alert("취소하셨습니다.");
		}
	});
	
	// 게시글 내용 수정 페이지 이동 시작
	$("button#modBtn").click(function(){
		let num = $("input#num").val().trim();
		let nowPage = $("input#nowPage").val().trim();
		let p3 = $("#pKeyField").val().trim();
		let p4 = $("#pKeyWord").val().trim();
		
		let url ="/boardModPage?";
		url += "num="+num+"&nowPage="+nowPage;
		url += "&keyField="+p3;
		url += "&keyWord="+p4;
		url += "&gnbParam=bbs";
		location.href = url;
	});
	
	// 글수정 페이지 게시글 수정 시작
	$("#modProcBtn").click(function(){
		let subject = $("#subject").val().trim();
		if(subject==""){
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else{
			$("#modFrm").attr("action","/boardMod");
			$("#modFrm").submit();
		}
	});
	
	// 게시글 내용보기 페이지에서 답변버튼
	$("td.read>button#replyBtn").click(function(){
		let nowPage = $("input#nowPage").val().trim();
		let num = $("input#num").val().trim();
		let p3 = $("#pKeyField").val().trim();
		let p4 = $("#pKeyWord").val().trim();
		
		let url ="/bbs/reply.jsp?";
			url += "num="+num+"&nowPage="+nowPage;
			url += "&keyField="+p3;
			url += "&keyWord="+p4;
			url += "&gnbParam=bbs";
		location.href = url;
	});
	
	// 답변입력양식 페이지에서 답변내용 전송
	$("td.reply>button#replyBtn").click(function(){
		let subject = $("#subject").val().trim();
		
		if(subject==""){
			alert("제목은 필수입력입니다.");
			$("#subject").focus();
		} else{
			$("#replyFrm").submit();
		}
	});
	
	//리스트페이지 검색
	$("button#searchBtn").click(function(){
		let keyWord = $("#keyWord").val().trim();
		if(keyWord==""){
			alert("검색어를 입력해주세요");
			$("#keyWord").focus();
		} else{
			$("#searchFrm").submit();
		}
	});
	
	// 검색 결과를 유지한 리스트페이지 이동
	$("#listBtn").click(function(){
		let param = $("input#nowPage").val().trim();
		let p3 = $("#pKeyField").val().trim();
		let p4 = $("#pKeyWord").val().trim();
		
		let url ="/boardList?nowPage"+param;
			url += "&keyField="+p3;
			url += "&keyWord="+p4;
			url += "&gnbParam=bbs";
		location.href = url;
	});
	
	/* 게시판 페이지 이동 시작 /bbs/list.jsp */
	
	// 글쓰기 수정하기 페이지 파일 삭제 버튼
	$("#fileDelBtn").click(function(){
		$(".spanFile").html("");
		$(".spanFile + small").text("* 파일이 삭제 됐습니다.");
		$("#fileDelData").val("1");
	});

})

function movePage(pageStart) {
	let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let url = "/bbs/list.jsp?nowPage="+pageStart;
		url += "&keyField=" + p3 ;
		url += "&keyWord=" + p4 ;
	location.href = url;
}

function moveBlock(nowBlock,pagePerBlock) {
	let nowPage = (nowBlock -1) * pagePerBlock +1;
	let p3 = $("#pKeyField").val().trim();  // p3 : keyField
	let p4 = $("#pKeyWord").val().trim();  // p4 : keyWord
	let url = "/bbs/list.jsp?nowPage="+nowPage;
		url += "&keyField=" + p3 ;
		url += "&keyWord=" + p4 ;
	location.href = url;
}

/* 게시판 페이지 이동 시작 /bbs/list.jsp */

// 상세내용 보기 페이지 이동
function read(p1){
	let p3 = $("#pKeyField").val().trim();
	let p4 = $("#pKeyWord").val().trim();
	let param = "/boardRead?num="+p1;
		param += "&gnbParam=bbs";
	location.href = param;
}
