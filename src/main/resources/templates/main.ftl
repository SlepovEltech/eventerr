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
                <form action="/event" method="post" enctype="multipart/form-data" >
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Название:</label>
                        <div class="col-sm-6">
                            <input type="text" name="name" class="form-control" placeholder="Введите название"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Дата:</label>
                        <div class="col-sm-6">
                            <input type="date" name="date" class="form-control" placeholder="Введите дату"/>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Описание:</label>
                        <div class="col-sm-6">
                            <input type="text" name="description" class="form-control" placeholder="Введите описание" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-2 col-form-label">Фото:</label>
                        <div class="col-sm-6">
                            <input type="file" name="file" class="form-control" />
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <button type="submit" class="btn btn-secondary ml-2">Добавить</button>
                </form>
            </div>
        </div>
    </#if>
    <div class="card-columns">
        <#list events as event>
            <div class="card my-3">
                <#if event.filename??>
                    <img class="card-img-top" src="${event.filename}">
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
