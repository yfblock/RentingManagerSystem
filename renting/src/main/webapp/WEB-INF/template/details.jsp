<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Post - Pintereso Bootstrap Template</title>
    <script type="text/javascript"> (function() { var css = document.createElement('link'); css.href = 'https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'; css.rel = 'stylesheet'; css.type = 'text/css'; document.getElementsByTagName('head')[0].appendChild(css); })(); </script>
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/theme.css">

</head>

<body>

<%@include file="../components/home_bar.jsp"%>

    <main role="main">
    <section class="bg-gray200 pt-5 pb-5">
    <div class="container">
    	<div class="row justify-content-center">
    		<div class="col-md-7">
    			<article class="card">
    			<img class="card-img-top mb-2" src="${house.cover}" alt="Card image">
    			<div class="card-body">
    				<h1 class="card-title display-4">${house.title}</h1>
					<div>
						地点：${house.position} 价格: ${house.price} / 月 面积: ${house.area} m<sup>2</sup>
					</div>
					<div>
						简介: ${house.details}
					</div>

					<div style="margin-top: 1em;">
						<button class="btn btn-success">点击租赁</button>
					</div>
    			</div>
    			</article>
    		</div>
    	</div>
    </div>

    </section>
        
    </main>

    <script src="assets/js/app.js"></script>
    <script src="assets/js/theme.js"></script>
</body>
    
</html>
