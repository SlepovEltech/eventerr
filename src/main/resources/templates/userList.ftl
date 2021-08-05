<#import "parts/common.ftl" as c>

<@c.page>
    <h1>Список пользователей сатй</h1>
    <table border="1">
        <thead>
            <tr>
                <th>Id</th>
                <th>Логин</th>
                <th>Пароль</th>
                <th>Роли</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td><#list user.roles as role> ${role} <#sep>, </#list></td>
                <td><a href="/user/${user.id}">edit</td>
            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>