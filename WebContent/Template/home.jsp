<html>
<link rel="stylesheet" type="text/css" href="../style/style.css" title="style" />
	<head>
		<title>Welcome To Student Zone</title>
		<link href="../SlideDate/js-image-slider.css" rel="stylesheet" type="text/css" />
    	<script src="../SlideDate/js-image-slider.js" type="text/javascript"></script>
    	<link href="../SlideDate/generic.css" rel="stylesheet" type="text/css" />
	</head>	
	<%
		HttpSession user=request.getSession();
		if(user.getAttribute("UserName")!=null)
		{
	%>
	<body style="font: normal .80em 'trebuchet ms', arial, sans-serif; background: #F0EFE2;  color: #777;">
			
	<div id="sliderFrame">
        <div id="ribbon"></div>
        <div id="slider">
            <img src="../SlideDate/1.jpg" alt="Take a step to help needy" />
            <img src="../SlideDate/2.jpg" alt="Spread awareness to grab the opportunity" />
            <img src="../SlideDate/3.jpg" alt="Children are the futher, so make them brighten" />
            <img src="../SlideDate/4.jpg" alt="Stop domestic violence" />
            <img src="../SlideDate/5.jpg" alt="Make your futher healthy" />
            <img src="../SlideDate/6.jpg" alt="Every one have right to food" />
            <img src="../SlideDate/7.jpg" alt="Help the people to fight against aids" />
            <img src="../SlideDate/8.jpg" alt="Take a step to help needy" />
        </div>
        <div id="htmlcaption" style="display: none;">
            
        </div>
                
        <!--thumbnails-->
        <div id="thumbs">
            <div class="thumb"><img src="../SlideDate/1-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/2-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/3-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/4-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/5-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/6-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/7-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/8-thumb.jpg" /></div>
            <div class="thumb"><img src="../SlideDate/1-thumb.jpg" /></div>
        </div>
    </div><br>
    <center><h3>About Us</h3></center>
    <div>
    Indian Social Services is a registered non-profit organization under the Indian Public Trust Act; Regd. No. 39/86, dated 13th March, 1986. We are also registered to receive tax-deductible foreign funds under the Foreign Contribution Regulation Act (FCRA) with the Ministry of Home Affairs, Government of India.
    </div>
	</body>	
	 <%
  		}
  		else
  			{
	  			response.sendRedirect("../Logout");
  			}
  		%>
</html>