<#import "parts/common.ftl" as c>

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

    <a class="btn btn-secondary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить новое мероприятие
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form action="" method="post" enctype="multipart/form-data">
                <input type="text" name="name" placeholder="Введите название мероприятия"/>
                <input type="date" name="date" placeholder="Введите дату"/>
                <input type="text" name="description" placeholder="Введите описание"/>
                <input type="file" name="file" />
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <button type="submit">Добавить</button>
            </form>
        </div>
    </div>
        <h1>Ближайшие мероприятия</h1>
        <table border="1">
        <#list events as event>
            <tr>
                <td>${event.id}</td>
                <td>${event.name}</td>
                <td>${event.date}</td>
                <td>${event.description}</td>
                <td><strong> ${event.authorName} </strong></td>
                <td>
                    <#if event.filename??>
                        <img src="/img/${event.filename}">
                    </#if>
                </td>
            </tr>
        <#else>
             Мероприятия не найдены
        </#list>
        </table>
</@c.page>
