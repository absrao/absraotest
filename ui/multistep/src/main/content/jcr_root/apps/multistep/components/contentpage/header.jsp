<%@include file="/libs/foundation/global.jsp"%><%
%><%@page session="false" contentType="text/html; charset=utf-8" %><%
%>
    

<header>
                <img src="images//calendaricon.png" id="ball_header_custom_image" width="45" class="custom_head_image" height="46" border="0">
                <div width="45" class="custom_head_image" height="46" border="0">
                <cq:include path="clalendarImage" resourceType="foundation/components/image" />
                </div>
                <img src="images//phoneicon_small.png" id="ball_header_custom_image2" width="25" class="custom_head_image2" height="25" style="padding-top:5px;padding-top:7px;" border="0">
                <div width="25" class="custom_head_image2" height="25" style="padding-top:5px;padding-top:7px;" border="0">
                    <cq:include path="phoneImage" resourceType="foundation/components/image" />
                </div>
                    <div id="header_logo">
                         <div id="header_link"></div>
                    </div>
                   
                    <div id="header_text_wrap" class="header_text_wrap"><h2 id="ball_Header_Block_1_a" style="padding-top:5px;line-height:10px;">
                    <cq:include path="headerTitle" resourceType="foundation/components/text" />
                   
                    <cq:include path="headerPhone" resourceType="foundation/components/text" />
                    </div>
</header>