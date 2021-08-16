<#import "parts/common.ftl" as c>
<#import "parts/event.ftl" as ev>
<#include "parts/security.ftl">

<@c.page>
    <h1 style="color: white" >${event.name}</h1>
    <h5>${event.date}</h5>
    <p class="">${event.description}</p>
    <#if isAuthor>
        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseEdit" role="button" aria-expanded="false" aria-controls="collapseExample">
            Редактировать
        </a>
        <div class="collapse" id="collapseEdit">
            <div class="form-group mt-3">
                <@ev.eventForm "/event/${event.id}/edit" "Редактировать" "${event.name}" "${event.date}" "${event.description}"/>
            </div>
        </div>
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
            <a href="/event/${event.id}/unsubscribe" class="btn btn-secondary">Отписаться</a>
        <#else>
            <a href="/event/${event.id}/subscribe" class="btn btn-secondary">Зарегистрироваться</a>
        </#if>
    </#if>
    <div class="page-bg">
    </div>

</@c.page>

<style>

    body {
        font-family: "Arial";
        color: #fff;
    }

    .my-color {
        font-family: "Arial";
        color: #000;
    }

    .page-bg {
        background: url("/img/${event.filename}") no-repeat;
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