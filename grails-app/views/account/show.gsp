<%@ page import="org.auction.Account" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'account.label', default: 'Account')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-account" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<!--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li> -->
				<li><g:link action="index" controller="listing"><g:message message="Listing List" /></g:link></li>
                <li class="pull-right">
                    <g:form controller="logout">
                        <a href="#" onclick="document.forms[0].submit()">Logout</a>
                     </g:form>
                </li>
            </ul>
		</div>

    <div id="show-account" class="content scaffold-show" role="main">
        <h1><g:message message="Show Account" /></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list account">
            <g:if test="${accountInstance?.username}">
                <li class="fieldcontain">
                    <span id="name-label" class="property-label"><g:message code="account.name.label" default="Name" /></span>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${accountInstance}" field="username"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.email}">
                <li class="fieldcontain">
                    <span id="email-label" class="property-label"><g:message code="account.email.label" default="Email" /></span>
                    <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${accountInstance}" field="email"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.address}">
                <li class="fieldcontain">
                    <span id="address-label" class="property-label"><g:message code="account.address.label" default="Address" /></span>
                    <span class="property-value" aria-labelledby="address-label"><g:fieldValue bean="${accountInstance}" field="address"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.password}">
                <li class="fieldcontain">
                    <span id="password-label" class="property-label"><g:message code="account.password.label" default="Password" /></span>
                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${accountInstance}" field="password"/></span>
                </li>
            </g:if>
            <g:if test="${accountInstance?.lastUpdated}">
                <li class="fieldcontain">
                    <span id="lastUpdated-label" class="property-label"><g:message code="account.lastUpdated.label" default="LastUpdated" /></span>
                    <span class="property-value" aria-labelledby="lastUpdated-label"><g:fieldValue bean="${accountInstance}" field="lastUpdated"/></span>
                </li>
            </g:if>
        </ol>

        <div id="list-review" class="content scaffold-list" role="main">
            <h1><g:message message="Review List" /></h1>
            <table>
                <thead>
                <tr>
                    <th style="background-image:none"><g:message code="account.receivedReviews.label" default="Seller Comments" /></th>
                    <th style="background-image:none"><g:message code="account.receivedReviews.label" default="Bidder Comments" /></th>
                    <th style="background-image:none"><g:message code="account.receivedReviews.label" default="Reviewers" /></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${accountInstance?.receivedReviews}" status="i" var="reviewInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                        <td>${fieldValue(bean: reviewInstance, field: "sellerComment")}</td>
                        <td>${fieldValue(bean: reviewInstance, field: "bidderComment")}</td>
                        <td>${fieldValue(bean: reviewInstance, field: "reviewerAccount.username")}</td>
                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${reviewInstanceCount ?: 0}" />
            </div>
        </div>

        <g:form url="[action:'delete', resource:accountInstance ]" method="DELETE">
            <fieldset class="buttons">
                <g:link action="edit" resource="${accountInstance}"><g:message code="default.button.edit.label" message="Edit Account" /></g:link>
                <g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', message: 'Delete Account')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </fieldset>
        </g:form>
    </div>

	</body>
</html>
