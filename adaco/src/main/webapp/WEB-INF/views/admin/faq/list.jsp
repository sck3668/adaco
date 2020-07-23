<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script>document.getElementsByTagName("html")[0].className += " js";</script>
<link rel="stylesheet" href="../assets/css/style.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>FAQ 자주 묻는 질문</title>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$(".delete").on("click", function(){
			var params = {
				_method: "delete",
				faqno : $(this).data("faqno"),
				_csrf : "${_csrf.token}"
			}
			$.ajax({
				url: "/adaco/admin/faq_delete",
				method: "post",
				data: params
			}).done(()=>{
				alert("삭제처리 되었습니다.");
				location.reload(true);
			}).fail((r)=>alert("삭제에 실패하였습니다. 사유:"+r));
			
		});
	});
</script>
</head>
<body>
<header class="cd-header flex flex-column flex-center">
  <div class="text-component text-center">
    <h1>FAQ 자주 묻는 질문</h1>
    <p>👈 <a class="cd-article-link" href="/adaco/user/questionWrite">궁금한게 해결되지 않으셨나요? (1:1문의로 이동하기)</a></p>
    <p>🏠<a class="cd-article-link" href="/adaco/">메인으로 돌아갈래요!</a></p>
  </div>
</header>

<section class="cd-faq js-cd-faq container max-width-md margin-top-lg margin-bottom-lg">
	<ul class="cd-faq__categories">
		<li><a class="cd-faq__category cd-faq__category-selected truncate" href="#basics">FAQ 10선</a></li>
		<sec:authorize access="hasRole('ROLE_ADMIN')">	
		<li><a class="cd-faq__category truncate" href="#mobile">관리자</a></li>
		</sec:authorize>
		<!-- 
		<li><a class="cd-faq__category truncate" href="#account">Account</a></li>
		<li><a class="cd-faq__category truncate" href="#payments">Payments</a></li>
		<li><a class="cd-faq__category truncate" href="#privacy">Privacy</a></li>
		<li><a class="cd-faq__category truncate" href="#delivery">Delivery</a></li>
		-->
	</ul> <!-- cd-faq__categories -->

	<div class="cd-faq__items">
		<ul id="basics" class="cd-faq__group">
		<li class="cd-faq__title"><h2>자주 묻는 질문</h2></li>
		<c:forEach items="${faqList }" var="faq">
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>${faq.title }</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>${faq.content }</p>
          </div>
          	<sec:authorize access="hasRole('ROLE_ADMIN')">
		  		<button type="button" id = "delete" class="delete btn btn-danger" data-faqno="${faq.faqno }"style="margin-left: 650px; margin-bottom: 20px;">삭제하기</button>
          	</sec:authorize>
				</div> <!-- cd-faq__content -->
		  </li>
		</c:forEach>
		</ul> <!-- cd-faq__group -->
		
		<sec:authorize access="hasRole('ROLE_ADMIN')">
		<ul id="mobile" class="cd-faq__group">
			<li class="cd-faq__title"><h2>관리자</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>FAQ 작성하기</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p><a href="/adaco/admin/faq_write">글 작성하기</a></p>
          </div>
				</div>
			</li>
			

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>작가 심사에 관하여</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>핸드스토리의 입점심사는 아래와 같은 사항을 중점적으로 심사받는다.<br>1. 작가 등록을 희망하는 회원은 사업자 등록번호와 입출금 계좌를 보내야하고, 관리자는 이를 인증 후 허가하여야 한다.
            <br>2. 핸드스토리는 고객에게 양질의 품질을 제공하기 위하여 작가 희망회원에 한해 작품의 사진과 정면, 측면, 후면 구도를 총 3장 이상 확인하여 심사 후 작가 권한을 부여한다.<br>
            	3. 작가 심사 후 승인 처리가 되면 메일에 동봉 된 개별 연락처로 연락하여 작가 심사 승인 알림을 보내고, 거부 시에는 쪽지로 거부 사유를 안내해주어야한다.</p>
          </div>
				</div>
			</li>
			
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>관리자 페이지로 이동</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p><a href = "/adaco/admin/">관리자 페이지로</a></p>
          </div>
				</div>
			</li>
		</ul>
		</sec:authorize>

		<!-- FAQ 카테고리 양식 -->
		<!--
		<ul id="account" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Account</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I change my password?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Perferendis earum autem consectetur labore eius tenetur esse, in temporibus sequi cum voluptatem vitae repellat nostrum odio perspiciatis dolores recusandae necessitatibus, unde, deserunt voluptas possimus veniam magni soluta deleniti! Architecto, quidem, totam. Fugit minus odit unde ea cupiditate ab aperiam sed dolore facere nihil laboriosam dolorum repellat deleniti aliquam fugiat laudantium delectus sint iure odio, necessitatibus rem quisquam! Ipsum praesentium quam nisi sint, impedit sapiente facilis laudantium mollitia quae fugiat similique. Dolor maiores aliquid incidunt commodi doloremque rem! Quaerat, debitis voluptatem vero qui enim, sunt reiciendis tempore inventore maxime quasi fugiat accusamus beatae modi voluptates iste officia esse soluta tempora labore quisquam fuga, cum. Sint nemo iste nulla accusamus quam qui quos, vero, minus id. Eius mollitia consequatur fugit nam consequuntur nesciunt illo id quis reprehenderit obcaecati voluptates corrupti, minus! Possimus, perspiciatis!</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I delete my account?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo tempore soluta, minus magnam non blanditiis dolore, in nam voluptas nobis minima deserunt deleniti id animi amet, suscipit consequuntur corporis nihil laborum facere temporibus. Qui inventore, doloribus facilis, provident soluta voluptas excepturi perspiciatis fugiat odit vero! Optio assumenda animi at! Assumenda doloremque nemo est sequi eaque, ipsum id, labore rem nisi, amet similique vel autem dolore totam facilis deserunt. Mollitia non ut libero unde accusamus praesentium sint maiores, illo, nemo aliquid?</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I change my account settings?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>I forgot my password. How do I reset it?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsum at aspernatur iure facere ab a corporis mollitia molestiae quod omnis minima, est labore quidem nobis accusantium ad totam sunt doloremque laudantium impedit similique iste quasi cum! Libero fugit at praesentium vero. Maiores non consequuntur rerum, nemo a qui repellat quibusdam architecto voluptatem? Sequi, possimus, cupiditate autem soluta ipsa rerum officiis cum libero delectus explicabo facilis, odit ullam aperiam reprehenderit! Vero ad non harum veritatis tempore beatae possimus, ex odio quo.</p>
          </div>
				</div> cd-faq__content
			</li>
		</ul> cd-faq__group

		<ul id="payments" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Payments</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I have an invoice for my subscription?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why did my credit card or PayPal payment fail?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Tenetur accusantium dolorem vel, ad, nostrum natus eos, nemo placeat quos nisi architecto rem dolorum amet consectetur molestiae reprehenderit cum harum commodi beatae necessitatibus. Mollitia a nostrum enim earum minima doloribus illum autem, provident vero et, aspernatur quae sunt illo dolorem. Corporis blanditiis, unde, neque, adipisci debitis quas ullam accusantium repudiandae eum nostrum quis! Velit esse harum qui, modi ratione debitis alias laboriosam minus eaque, quod, itaque labore illo totam aut quia fuga nemo. Perferendis ipsa laborum atque assumenda tempore aspernatur a eos harum non id commodi excepturi quaerat ullam, explicabo, incidunt ipsam, accusantium quo magni ut! Ratione, magnam. Delectus nesciunt impedit praesentium sed, aliquam architecto dolores quae, distinctio consectetur obcaecati esse, consequuntur vel sit quis blanditiis possimus dolorum. Eaque architecto doloremque aliquid quae cumque, vitae perferendis enim, iure fugiat, soluta aut!</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Why does my bank statement show multiple charges for one upgrade?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>
		</ul> cd-faq__group

		<ul id="privacy" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Privacy</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Can I specify my own private key?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>My files are missing! How do I get them back?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I access my account data?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus magni vero deserunt enim et quia in aliquam, rem tempore voluptas illo nisi veritatis quas quod placeat ipsa! Error qui harum accusamus incidunt at libero ipsum, suscipit dolorum esse explicabo in eius voluptates quidem voluptatem inventore amet eaque deserunt veniam dignissimos excepturi? Dolore, quo amet nostrum autem nemo. Sit nam assumenda, corporis ea sunt distinctio nostrum doloribus alias, beatae nesciunt dolore saepe consequuntur minima eveniet porro dolor officiis maiores ab obcaecati officia enim aliquam. Itaque fuga molestiae hic accusantium atque corporis quia id sequi enim vero? Hic aperiam sint facilis aliquam quia, accusamus tenetur earum totam enim est, error. Iusto, reiciendis necessitatibus molestias. Voluptatibus eos explicabo repellat nesciunt nam vero minima.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I control if other search engines can link to my profile?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>
		</ul> cd-faq__group

		<ul id="delivery" class="cd-faq__group">
			<li class="cd-faq__title"><h2>Delivery</h2></li>
			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>What should I do if my order hasn't been delivered yet?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How can I find your international delivery information?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>Who takes care of shipping?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do returns or refunds work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Impedit quidem delectus rerum eligendi mollitia, repudiandae quae beatae. Et repellat quam atque corrupti iusto architecto impedit explicabo repudiandae qui similique aut iure ipsum quis inventore nulla error aliquid alias quia dolorem dolore, odio excepturi veniam odit veritatis. Quo iure magnam, et cum. Laudantium, eaque non? Tempore nihil corporis cumque dolor ipsum accusamus sapiente aliquid quis ea assumenda deserunt praesentium voluptatibus, accusantium a mollitia necessitatibus nostrum voluptatem numquam modi ab, sint rem.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How do I use shipping profiles?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your UK Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>How does your Next Day Delivery service work?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order arrive?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>

			<li class="cd-faq__item">
				<a class="cd-faq__trigger" href="#0"><span>When will my order ship?</span></a>
				<div class="cd-faq__content">
          <div class="text-component">
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Blanditiis provident officiis, reprehenderit numquam. Praesentium veritatis eos tenetur magni debitis inventore fugit, magnam, reiciendis, saepe obcaecati ex vero quaerat distinctio velit.</p>
          </div>
				</div> cd-faq__content
			</li>
		</ul> cd-faq__group -->
	</div> <!-- cd-faq__items -->

	<a href="#0" class="cd-faq__close-panel text-replace">Close</a>
  <div class="cd-faq__overlay" aria-hidden="true"></div>
</section> <!-- cd-faq -->
<script src="../assets/js/util.js"></script> <!-- util functions included in the CodyHouse framework -->
<script src="../assets/js/main.js"></script> 
</body>
</html>