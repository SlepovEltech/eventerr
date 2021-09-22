<#import "parts/common.ftl" as c>

<@c.page>
    <h3>Мои регистрации</h3>
    <div class="card-columns">
        <#list events as event>
            <div class="card my-3">
                <#if event.filename??>
                    <img class="card-img-top" src="${event.filename}" >
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${event.name}</h5>
                    <h6>${event.date}</h6>
                    <p class="card-text">${event.description}</p>
                    <h6>${event.authorName}</h6>
                    <a href="/event/${event.id}" class="btn btn-secondary">К событию</a>
                </div>
            </div>
        <#else>
            <p>Регистрации не найдены</p>
        </#list>
    </div>

    <h3>Организованные мероприятия</h3>
    <div class="card-columns">
        <#list eventManager as event>
            <div class="card my-3">
                <#if event.filename??>
                    <img class="card-img-top" src="${event.filename}" >
                </#if>
                <div class="card-body">
                    <h5 class="card-title">${event.name}</h5>
                    <h6>${event.date}</h6>
                    <p class="card-text">${event.description}</p>
                    <h6>${event.authorName}</h6>
                    <a href="/event/${event.id}" class="btn btn-secondary">К событию</a>
                </div>
            </div>
        <#else>
            <p>Регистрации не найдены</p>
        </#list>
    </div>

</@c.page>