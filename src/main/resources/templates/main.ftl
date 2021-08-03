<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Main</h1>
    <div>
        <@l.logout />
    </div>
    <a href="/user">User list</a>

    <form action="/main" method="post" enctype="multipart/form-data">
        <input type="text" name="name" placeholder="Введите название мероприятия"/>
        <input type="date" name="date" placeholder="Введите дату"/>
        <input type="text" name="description" placeholder="Введите описание"/>
        <input type="file" name="file" />
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Добавить</button>
    </form>
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
        No message
    </#list>
    </table>
</@c.page>
