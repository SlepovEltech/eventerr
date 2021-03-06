<#macro login path btn>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Логин:</label>
            <div class="col-sm-6">
                <input type="text" name="username" class="form-control"/>
            </div>
        </div>
        <#if path == "/signup">
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Имя:</label>
                <div class="col-sm-6">
                    <input type="text"  name="first_name"  class="form-control">
                </div>
            </div>
            <div class="form-group row">
                <label class="col-sm-2 col-form-label">Фамилия:</label>
                <div class="col-sm-6">
                    <input type="text"  name="last_name" class="form-control">
                </div>
            </div>
        </#if>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label"> Пароль: </label>
            <div class="col-sm-6">
                <input type="password" name="password" class="form-control"/>
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-secondary" type="submit" >${btn}</button>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" value="Выйти" class="btn btn-secondary">Выйти</button>
    </form>
</#macro>