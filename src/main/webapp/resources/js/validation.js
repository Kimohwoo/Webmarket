function CheckAddProduct() {

	var bookId = document.getElementById("bookId");
	var bname = document.getElementById("bname");
	var bookPrice = document.getElementById("bookPrice");
	
	// 상품아아디 체크
	if (!check(/^P[0-9]{4,11}$/, bookId,
			"[상품 코드]\nP와 숫자를 조합하여 5~12자까지 입력하세요\n첫 글자는 반드시 P로 시작하세요"))
		return false;
	// 상품명 체크
	if (bname.value.length < 4 || bname.value.length > 12) {
		alert("[상품명]\n최소 4자에서 최대 50자까지 입력하세요");
		bname.select();
		bname.focus();
		return false;
	}
	// 상품 가격 체크
	if (bookPrice.value.length == 0 || isNaN(bookPrice.value)) {
		alert("[가격]\n숫자만 입력하세요");
		bookPrice.select();
		bookPrice.focus();
		return false;
	}

	if (bookPrice.value < 0) {
		alert("[가격]\n음수를 입력할 수 없습니다");
		bookPrice.select();
		bookPrice.focus();
		return false;
	} else if (!check(/^\d+(?:[.]?[\d]?[\d])?$/, bookPrice,
			"[가격]\n소수점 둘째 자리까지만 입력하세요"))
		return false;

	function check(regExp, e, msg) {

		if (regExp.test(e.value)) {
			return true;
		}
		alert(msg);
		e.select();
		e.focus();
		return false;
	}

//	 document.newProduct.submit()
	var a1 = "newBook";
	document.forms[a1].submit();

}







