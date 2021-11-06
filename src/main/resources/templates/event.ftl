<#import "parts/common.ftl" as c>
<#import "parts/event.ftl" as ev>
<#include "parts/security.ftl">

<@c.page>
    <h1>${event.name}</h1>
    <h5>${event.date}</h5>
    <p class="">${event.description}</p>
    <#if isAuthor>
        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseEdit" role="button" aria-expanded="false" aria-controls="collapseExample">
            Редактировать
        </a>
        <div class="collapse" id="collapseEdit">
            <div class="form-group mt-3">
                <@ev.eventForm "/event/${event.id}/edit" "Обновить" "${event.name}"
                "${event.date}" "${event.description}"
                "${event.filename}" "" />
<#--            <#if event.maptag?has_content>-->
<#--                <@ev.eventForm "/event/${event.id}/edit" "Обновить" "${event.name}"-->
<#--                "${event.date}" "${event.description}"-->
<#--                "${event.filename}" "${event.maptag}" />-->
<#--            <#else>-->
<#--                <@ev.eventForm "/event/${event.id}/edit" "Обновить" "${event.name}"-->
<#--                "${event.date}" "${event.description}"-->
<#--                "${event.filename}" "" />-->
<#--            </#if>-->
            </div>
        </div>
        <a href="/event/${event.id}/delete" class="btn btn-secondary">Удалить</a>
        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseList" role="button" aria-expanded="false" aria-controls="collapseExample">
            Показать список гостей
        </a>
        <div class="collapse" id="collapseList">
            <div class="form-group mt-3">
                <h3>Список гостей</h3>
                <table class="table table-striped table-dark">
                    <thead >
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Имя</th>
                        </tr>
                    </thead>
                    <tbody>
                    <#list users as user>
                        <tr>
                            <th scope="row">${user_index+1}</th>
                            <td>${user.first_name!""} ${user.last_name!""} </td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
    <#else>
        <#if isSubscriber>
            <h4>Вы успешно зарегистрированы</h4>
            <div style="margin-bottom: 15px">
                <img src="https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=https://eventerr.herokuapp.com/event/${event.id}/${guestID}">
            </div>
            <a href="/event/${event.id}/unsubscribe" class="btn btn-secondary">Отписаться</a>
        <#else>
            <a href="/event/${event.id}/subscribe" class="btn btn-secondary">Зарегистрироваться</a>
        </#if>
    </#if>
    <#if event.maptag?has_content>
    <a class="btn btn-secondary" data-toggle="collapse" href="#collapseMap" role="button" aria-expanded="false" aria-controls="collapseExample">
        Показать карту
    </a>
    <div class="collapse" id="collapseMap">
        <div class="form-group mt-3">
            ${event.maptag}
        </div>
    </div>
    </#if>

    <div class="page-bg"></div>

</@c.page>

<style>

    body {
        font-family: "Arial";
        <#if event.filename?has_content>
            color: #fff;
        <#else>
            color: #000;
        </#if>
    }

    .page-bg {
        background: url("${event.filename}") no-repeat;
        background-size: cover;
        -webkit-filter: blur(5px);
        /*-moz-filter: blur(5px);*/
        /*-o-filter: blur(5px);*/
        -ms-filter: blur(5px);
        filter: blur(5px);
        position: fixed;
        width: 100%;
        height: 100%;
        top: 0;
        left: 0;
        z-index: -1;
    }

</style>