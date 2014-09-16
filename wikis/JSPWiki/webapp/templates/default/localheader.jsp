<%--
    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.  
--%>

<%-- This is a local JSP header file, which you can override in your own template
     if you want to put something in the head-section of the page.  This page is
     included after the commonheader.jsp.

     The JSPWiki default template and distribution will never have anything here
     except this comment.  Therefore it's safe to override without accidentally
     removing any functionality.

     Some things which you might want to put here would e.g. be your site tracker
     Javascript (like Google Analytics, or Sitemeter, or whatever).

     The safest trick would be to create your own template (say "sitetemplate") directory,
     and just put a new localheader.jsp in it.  JSPWiki will always use the
     files in the "default" template, if it cannot locate an equivalent file in
     your defined template directory.
     --%>
<!-- Google Analytics -->
<script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-54223073-1', 'auto');
  ga('send', 'pageview');
</script>
<!-- End Google Analytics -->

