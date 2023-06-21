<%@ tag language="java"  pageEncoding="UTF-8"%>
<%@ attribute name="url" type="java.lang.String" required="true" %>

<li class="nav-item">
    <a href="${url}" class="nav-link ${originPath eq url?"active":""}">
        <jsp:doBody />
    </a>
</li>