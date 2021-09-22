<#macro eventForm path btn name date description>
    <form action=${path} method="post" enctype="multipart/form-data" >
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Название:</label>
            <div class="col-sm-6">
                <input type="text" name="name" class="form-control" value="${name}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Дата:</label>
            <div class="col-sm-6">
                <input type="date" name="date" class="form-control" value="${date}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Описание:</label>
            <div class="col-sm-6">
                <input type="text" name="description" class="form-control" placeholder="Введите описание"  value="${description}"/>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-2 col-form-label">Фото:</label>
<#--            <div class="col-sm-6">-->
<#--                <input type="file" name="file" class="form-control" />-->
<#--            </div>-->
            <div class="col-sm-6">
                <input type="text" name="file" class="form-control" />
            </div>
        </div>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button type="submit" class="btn btn-secondary ml-2">${btn}</button>
    </form>
</#macro>