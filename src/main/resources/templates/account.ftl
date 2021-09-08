<#import "parts/common.ftl" as c>
<#include "parts/security.ftl">

<@c.page>
    <h1>Личный кабинет</h1>
    <#if message??>
        <div class="alert alert-success" role="alert">
            ${message}
        </div>
    </#if>
    <form action="/user/account" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" value="${user.username}" name="username"  class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Почта:</label>
            <div class="col-sm-6">
                <input type="text" value="${user.email!""}" name="email"  class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Имя:</label>
            <div class="col-sm-6">
                <input type="text" value="${user.first_name!""}" name="first_name"  class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Фамилия:</label>
            <div class="col-sm-6">
                <input type="text" value="${user.last_name!""}" name="last_name" class="form-control">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Пароль:</label>
            <div class="col-sm-6">
                <input type="text" value="${user.password}" name="password" class="form-control">
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-secondary">Сохранить</button>

    </form>
</@c.page>