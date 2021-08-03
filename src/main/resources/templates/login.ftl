<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
    <h1>Login page</h1>
    <@l.login "/login" "Sign In"/>
    <a href="/signup">Add new user</a>
</@c.page>
