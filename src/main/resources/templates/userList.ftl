<#import "parts/common.ftl" as c>

<@c.page>
    <h1>Список пользователей сайта</h1>
    <table  class="table">
        <thead class="thead-light">
            <tr>
                <th scope="col">Id</th>
                <th scope="col">Логин</th>
                <th scope="col">Пароль</th>
                <th scope="col">Имя</th>
                <th scope="col">Роли</th>
                <th scope="col"></th>
            </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td scope="col">${user.id}</td>
                <td>${user.username}</td>
                <td>${user.password}</td>
                <td>${user.first_name!""} &nbsp; ${user.last_name!""}</td>
                <td><#list user.roles as role> ${role} <#sep>, </#list></td>
                <td><a href="/user/${user.id}">Редактировать</td>
            </tr>
        </#list>
        </tbody>
    </table>

</@c.page>