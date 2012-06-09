<%--
  ~ Licensed to the Apache Software Foundation (ASF) under one
  ~        or more contributor license agreements.  See the NOTICE file
  ~        distributed with this work for additional information
  ~        regarding copyright ownership.  The ASF licenses this file
  ~        to you under the Apache License, Version 2.0 (the
  ~        "License"); you may not use this file except in compliance
  ~        with the License.  You may obtain a copy of the License at
  ~
  ~          http://www.apache.org/licenses/LICENSE-2.0
  ~
  ~        Unless required by applicable law or agreed to in writing,
  ~        software distributed under the License is distributed on an
  ~        "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
  ~        KIND, either express or implied.  See the License for the
  ~        specific language governing permissions and limitations
  ~        under the License.
  --%>

<%@ include file="/jsp/header.jsp" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- /header -->
<div class="mainHeaderPanel" data-position="inline" data-role="header" role="banner">
    <h1><c:out value="${pageTitle}"/></h1>
    <a href="<c:out value='${homeURL}'/>" data-icon="home" data-iconpos="notext" data-direction="reverse">Home</a>
    <c:url var="queueSettingsURL" value="/jsp/queue-settings-dialog.jsp"/>
    <a href="<c:out value='${queueSettingsURL}'/>" data-icon="gear" data-rel="dialog" class="ui-btn-right">Options</a>
</div>


<div data-role="content">

    <c:choose>
        <c:when test="${!empty(currentTrack)}">

            <div data-role="content">
                <c:url var="albumCoverURL" value="/media/${track.albumCoverLink.id}"/>
                <img src="<c:out value="${albumCoverURL}"/>"/>
                <c:out value="${currentTrack.title}"/>
                <p><strong><c:out value="${track.artistNames}"/></strong></p>
                <p><strong>(<c:out value="${track.length}"/>)</strong></p>
            </div>

            <c:choose>
                <c:when test="${!empty(queuedTracks)}">
                    <ul data-role="listview" data-theme="a" data-inset="true" data-split-icon="minus"
                        data-split-theme="a">
                        <c:forEach items="${queuedTracks}" var="track">
                            <c:url var="trackURL" value="/ui/media/${track.id.id}"/>
                            <li>
                                <a href="<c:out value="${trackURL}"/>">
                                    <c:url var="albumCoverURL" value="/media/${track.albumCoverLink.id}"/>
                                    <img src="<c:out value="${albumCoverURL}"/>"/>

                                    <h3><c:out value="${track.title}"/></h3>

                                    <p><strong><c:out value="${track.artistNames}"/></strong></p>

                                    <p><strong>(<c:out value="${track.length}"/>)</strong></p>
                                </a>
                                <c:url var="queueTrackURL"
                                       value="/ui/queue/remove/${track.id.id}"/>
                                <a href="<c:out value="${queueTrackURL}"/>" data-rel="dialog" data-transition="slideup">Remove
                                    Track</a>


                                    <%--
                                    <a href="<c:out value="${queuedTrackURL}"/>">
                                        <h3><c:out value="${queuedTrack.title}"/></h3>
                                        <c:url var="queueTrackURL" value="/queue/jahspotify:queue:default/add/${track.id.id}"/>
                                                            <a href="<c:out value="${queueTrackURL}"/>" data-rel="dialog" data-transition="slideup">Queue Track</a>
                                    </a>--%>
                            </li>
                        </c:forEach>
                    </ul>
                </c:when>
                <c:otherwise>
                    <p>Queue is empty</p>
                </c:otherwise>
            </c:choose>
        </c:when>
        <c:otherwise>
            <div><p>Queue is empty</p></div>
            <div><p>Start Random One</p></div>
        </c:otherwise>
    </c:choose>
</div>

<%@ include file="/jsp/footer.jsp" %>