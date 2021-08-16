<#import "parts/common.ftl" as c>
<#import "parts/event.ftl" as ev>
<#include "parts/security.ftl">

<@c.page>
    <h1>Актуальные события</h1>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Поиск по мероприятиям">
                <button type="submit" class="btn btn-secondary ml-2">Найти</button>
            </form>
        </div>
    </div>
    <#if name!="unknown">
        <a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
            Добавить новое мероприятие
        </a>
        <div class="collapse" id="collapseExample">
            <div class="form-group mt-3">
                <@ev.eventForm "" "Добавить" "" "" ""/>
            </div>
        </div>
    </#if>
    <div class="card-columns">
        <#list events as event>
            <div class="card my-3">
                <#if event.filename??>
                    <img class="card-img-top" src="/img/${event.filename}" >
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${event.name}</h5>
                    <h6>${event.date}</h6>
                    <p class="card-text">${event.description}</p>
                    <h6>${event.authorName}</h6>
                    <a href="event/${event.id}" class="btn btn-secondary">Регистрация</a>
                </div>
            </div>
        <#else>
            Мероприятия не найдены
        </#list>
    </div>
</@c.page>
