<#import  "parts/common.ftl" as c>

<@c.page>
<h1>Редактировать пользователя</h1>

    <form action="/user" method="post">
        <div>User ID: ${user.id} </div>
        <input type="text" value="${user.username}" name="username">
        <#list roles as role>
            <div>
                <label>
                    <input type="checkbox" name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                </label>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit">Сохранить</button>
    </form>
</@c.page>