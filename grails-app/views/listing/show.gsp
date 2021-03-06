<%@ page import="org.auction.Listing" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'listing.label', default: 'Listing')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-listing" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><g:link action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
            </ul>
		</div>
		<div id="show-listing" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list listing">
				<g:if test="${listingInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="listing.name.label" default="Name" /></span>
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${listingInstance}" field="name"/></span>
				</li>
				</g:if>
			
				<g:if test="${listingInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="listing.description.label" default="Description" /></span>
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${listingInstance}" field="description"/></span>
				</li>
				</g:if>
			
				<li class="fieldcontain">
					<span id="startPrice-label" class="property-label"><g:message code="listing.startPrice.label" default="Start Price" /></span>
						<span class="property-value" aria-labelledby="startPrice-label">$<g:fieldValue bean="${listingInstance}" field="startPrice"/></span>
				</li>

				<g:if test="${listingInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="listing.startDate.label" default="Start Date" /></span>
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate format="yyyy-MM-dd" date="${listingInstance?.startDate}" /></span>
				</li>
				</g:if>

				<li class="fieldcontain">
					<span id="listingDays-label" class="property-label"><g:message code="listing.listingDays.label" default="Listing Days" /></span>
						<span class="property-value" aria-labelledby="listingDays-label"><g:fieldValue bean="${listingInstance}" field="listingDays"/></span>
				</li>

                <g:if test="${listingInstance?.sellerAccount}">
                    <li class="fieldcontain">
                        <span id="sellerAccount-label" class="property-label"><g:message code="listing.sellerAccount.label" default="Seller Account" /></span>
                        <span class="property-value" aria-labelledby="sellerAccount-label"><g:link controller="account" action="show" id="${listingInstance?.sellerAccount?.id}">${listingInstance?.sellerAccount?.username}</g:link></span>
                        <g:if test="${listingInstance.completed}">
                            <span class="property-value" aria-labelledby="sellerAccount-label" ><g:link action="createseller" controller="review" params="[id:params.id, name:listingInstance?.sellerAccount?.id]" >[Rate this account]</g:link></span>
                        </g:if>
                    </li>
                </g:if>

				<g:if test="${listingInstance?.deliverOption}">
				<li class="fieldcontain">
					<span id="deliverOption-label" class="property-label"><g:message code="listing.deliverOption.label" default="DeliverOption" /></span>
						<span class="property-value" aria-labelledby="deliverOption-label">${listingInstance?.deliverOption?.name}</span>
				</li>
				</g:if>
			</ol>

            <g:form url="[resource:listingInstance, action:'delete']" method="DELETE">
                <fieldset class="buttons">
                    <g:link action="edit" resource="${listingInstance}"><g:message code="default.button.edit.label" message="Edit Listing" /></g:link>
                    <g:actionSubmit action="delete" value="${message(code: 'default.button.delete.label', message: 'Delete Listing')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
                    <g:if test="${!listingInstance.completed}">
                        <g:link action="create" id="${params.id}" controller="bidding"><g:message message="Create Bidding" /></g:link>
                    </g:if>
                </fieldset>
            </g:form>

            <div style="height: 20px"></div>
            <div>
                <g:if test="${listingInstance.completed}">
                    <h1>Winner Account</h1>
                    <div class="property-list listing">
                       ${listingInstance.highBidAccount?.username}
                    </div>
                </g:if>
            </div>

            <div>
                <h1>Highest Bid</h1>
                <div class="property-list listing">
                    $${listingInstance.highBid}
                </div>
            </div>

            <div>
                <h1 style="border: 0">Bidding History</h1>
                <div>
                <table>
                    <thead>
                    <tr style="background-image:none">
                        <th style="background-image:none"><g:message message="Bidding Account" /></th>
                        <th style="background-image:none"><g:message message="Amount" /></th>
                        <g:if test="${listingInstance.completed}">
                            <th style="background-image:none"><g:message message="" /></th>
                        </g:if>
                    </tr>
                    </thead>
                    <tbody>
                    <g:each in="${listingInstance.biddings}" status="i" var="biddingInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                            <td><g:link controller="bidding" action="show" id="${biddingInstance.id}">${fieldValue(bean: biddingInstance, field: "biddingAccount.username")}</g:link></td>
                            <td>$${fieldValue(bean: biddingInstance, field: "amount")}</td>
                            <g:if test="${listingInstance.completed}">
                                <td><g:link action="createbidder" controller="review" params="[id:params.id, name:biddingInstance?.biddingAccount.id]" >[Rate this account]</g:link></td>
                            </g:if>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
                </div>
            </div>
		</div>
	</body>
</html>
