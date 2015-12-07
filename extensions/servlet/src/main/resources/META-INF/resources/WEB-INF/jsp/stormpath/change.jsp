<%--
  ~ Copyright 2015 Stormpath, Inc.
  ~
  ~ Licensed under the Apache License, Version 2.0 (the "License");
  ~ you may not use this file except in compliance with the License.
  ~ You may obtain a copy of the License at
  ~
  ~     http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~ Unless required by applicable law or agreed to in writing, software
  ~ distributed under the License is distributed on an "AS IS" BASIS,
  ~ WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  ~ See the License for the specific language governing permissions and
  ~ limitations under the License.
  --%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://stormpath.com/jsp/tags/templates" %>
<%@ taglib prefix="sp" uri="http://stormpath.com/jsp/tags" %>

<t:page>
    <jsp:attribute name="title"><sp:message key="stormpath.web.change.title"/></jsp:attribute>
    <jsp:attribute name="bodyCssClass">login</jsp:attribute>
    <jsp:body>
        <div class="container custom-container">

            <div class="va-wrapper">

                <div class="view login-view container">

                    <div class="box row">

                        <div class="email-password-area col-xs-12 large col-sm-12">

                            <div class="header">
                                <span><sp:message key="stormpath.web.change.form.title"/></span>
                                <p><sp:message key="stormpath.web.change.form.instructions"/></p>
                            </div>

                            <c:if test="${!empty errors}">
                                <div class="alert alert-dismissable alert-danger bad-login">
                                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                                    <c:forEach items="${errors}" var="error">
                                        <p>${error}</p>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <form method="post" role="form" class="login-form form-horizontal">
                                <c:if test="${!empty form.next}">
                                    <input name="next" type="hidden" value="${form.next}">
                                </c:if>

                                <c:forEach items="${form.hiddenFields}" var="field">
                                    <input name="${field.name}" value="${field.value}" type="${field.type}"/>
                                </c:forEach>

                                <c:forEach items="${form.visibleFields}" var="field">
                                    <c:choose>
                                        <c:when test="${field.type == 'hidden'}">
                                            <input name="${field.name}" value="${field.value}" type="${field.type}"/>
                                        </c:when>
                                        <c:otherwise>
                                            <div form-group="true" class="form-group group-${field.name}">
                                                <label class="col-sm-4"><sp:message key="${field.label}"/></label>
                                                <div class="col-sm-8">
                                                    <input name="${field.name}" value="${field.value}" type="${field.type}"
                                                           placeholder="<sp:message key="${field.placeholder}"/>"
                                                           <c:if test="${field.autofocus}">autofocus="autofocus" </c:if>
                                                           <c:if test="${field.required}">required="required" </c:if>
                                                           class="form-control"/>
                                                </div>
                                            </div>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>

                                <div>
                                    <button type="submit" class="login btn btn-login btn-sp-green"><sp:message key="stormpath.web.change.form.button.value"/></button>
                                </div>
                            </form>

                        </div>

                    </div>

                    <a href="${pageContext.request.contextPath}${loginUri}" class="to-login"><sp:message key="stormpath.web.change.form.loginLink.text"/></a>

                </div>

            </div>

        </div>
    </jsp:body>
</t:page>
