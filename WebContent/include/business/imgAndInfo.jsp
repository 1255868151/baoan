<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
 
$(function(){
    });
    $(".buyLink").click(function(){
        var page = "forecheckLogin";
        $.get(
                page,
                function(result){
                    if("success"==result){
                        var num = $(".productNumberSetting").val();
                        location.href= $(".buyLink").attr("href")+"&num="+num;
                    }
                    else{
                        $("#loginModal").modal('show');                     
                    }
                }
        );      
        return false;
    });
     
    $("button.loginSubmitButton").click(function(){
        var name = $("#name").val();
        var password = $("#password").val();
         
        if(0==name.length||0==password.length){
            $("span.errorMessage").html("请输入账号密码");
            $("div.loginErrorMessageDiv").show();           
            return false;
        }
         
        var page = "foreloginAjax";
        $.get(
                page,
                {"name":name,"password":password},
                function(result){
                    if("success"==result){
                        location.reload();
                    }
                    else{
                        $("span.errorMessage").html("账号密码错误");
                        $("div.loginErrorMessageDiv").show();                       
                    }
                }
        );          
         
        return true;
    });
</script>
 
<div class="imgAndInfo">
    <div class="infoInimgAndInfo">
        <div class="productPrice">
            <div class="juhuasuan">
                <div class="juhuasuanBig" >业务信息</div>
                
            </div>
            <div class="productPriceDiv">
               <div class="gouwujuanDiv">
                <span> 申请服务须知：</span>
                <span>本次业务将由****保安公司提供</span>
                </div>
                 <div class="originalDiv">
                    <span class="originalPriceDesc">业务名称</span>
                    <span class="originalPriceYuan">:</span>
                    <span class="originalPrice">
					   ${ps1.name}  
                    </span>
                </div> 
            </div>
        </div>
        <div class="serviceCommitment">
            <span class="serviceCommitmentDesc">服务承诺</span>
            <span class="serviceCommitmentLink">
                <a href="#nowhere">专业技防</a>
                <a href="#nowhere">安全服务</a>
                <a href="#nowhere">法律法规</a>
            </span>
        </div>    
         
          <div class="buyDiv">
            <a class="buyLink" href="forebuyone?pid=${ps1.id}"><button class="buyButton">立即申请</button></a>
        </div> 
    </div>
     
    <div style="clear:both"></div>
     
</div>