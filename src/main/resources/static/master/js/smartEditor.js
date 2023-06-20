var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "content", // 저는 textarea의 id와 똑같이 적어줬습니다.
	sSkinURI : "/smarteditor/SmartEditor2Skin.html", // 경로를 꼭 맞춰주세요!
	fCreator : "createSEditor2",
	htParams : {
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,

		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,

		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false,
		fOnBeforeUnload : function() {
		}
	},

	fOnAppLoad : function() {
		// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
	}
});

$("#writeBtn").click(function() {
	oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
	var content = document.getElementById("content").value;
});

