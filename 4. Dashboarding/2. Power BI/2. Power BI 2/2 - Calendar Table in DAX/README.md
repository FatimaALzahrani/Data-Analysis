<div role="tabpanel" class="tab-pane" id="exercise-solution">
<div id="exercice-content" class="px-5 py-3">


<h3 id="relevant-links-for-this-challenge">Relevant links for this challenge</h3>

<p>Data sources:</p>

<p><a href="https://drive.google.com/file/d/1N5oJ5AnirIzXdboNFZ4gQHwuOry_y4iq/view?usp=drive_link" target="_blank">products_expdate.csv</a></p>

<p><a href="https://drive.google.com/file/d/1EW-x7mbZylEFxAtngkQYYkIYFZTtXEV7/view?usp=drive_link" target="_blank">Solution file</a></p>

<h2 id="context--objectives">Context &amp; Objectives</h2>

<p>Creating a Calendar Table in Power BI using DAX is vital for performing time-intelligence calculations, comparative analysis, and customized date hierarchies.</p>

<ul>
<li>
<p>The challenge aims to have participants create a dynamic Calendar Table, define DAX measures for time-related calculations, perform comparative sales analysis, and visualize trends using the table.</p>
</li>
<li>
<p>Participants will develop expertise in leveraging Calendar Tables for insightful reporting and effective data-driven decision-making.</p>
</li>
</ul>

<p><strong>What you will learn:</strong></p>

<ul>
<li>
<p>Learn how to create and connect a Calendar Table to your Data model</p>
</li>
<li>
<p>Learn the benefits of using a Calendar Table</p>
</li>
</ul>

<p><br></p>

<h2 id="import-the-file">Import the File</h2>

<p>Open the file <code>products_expdate</code></p>

<p>❗️The Date format is <u>**‘Month - Day - Year’**</u></p>

<details>
<summary>Hint </summary>

<ul>
<li>You can use the CalendarAuto() function (read more about this function <a href="https://learn.microsoft.com/en-us/dax/calendarauto-function-dax" target="_blank">here</a>)</li>
<li>OR alternatively the Calendar function (eg. CALENDAR (DATE (1910, 1,1), DATE(2030,12,31)) but adjusting the dates so it better suits your model needs</li>
</ul>
</details>

<p><br></p>

<h2 id="create-a-calendar-table-using-dax">Create a Calendar Table (Using DAX)</h2>

<ol>
<li>
<p>Create a new table with <code>Dates</code> and name it as <code>DatesCalendar</code></p>

<ul>
<li>Make sure the date range cover all dates in the other tables so that it can be used properly</li>
</ul>

<details>
<summary>Hint </summary>
<p>Use the YEAR, MONTH, WEEKDAY and WEEKNUM functions to create the new columns in the DatesCalendar table</p>
</details>

<details>
<summary>Note</summary>

<p>You must make sure that PowerBI is able to read the Exp Date column as a US-formatted date. You can use PowerQuery to set the Locale data type to US date
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/03-Calendar-Table-in-DAX-asset-1-image.png" alt=""></p>

</details>
</li>
<li>
<p>Add new columns on the <code>DatesCalendar</code> Table for <code>Year</code>, <code>Months</code>, <code>Week_num</code>, <code>Weekday</code></p>

<p><br></p>
</li>
</ol>

<h2 id="linking-your-tables">Linking your tables</h2>

<p>Your <code>DatesCalendar</code> Table needs to be linked to the other tables that contain a date if you wish to use the data.</p>

<ol>
<li>
<p>Link the date in <code>DatesCalendar</code> to the<em>**</em> <code>products_expdate</code> table</p>

<details>
<summary>Hint</summary>

<p>When you have multiple tables containing different dates, you will need to link your <code>DatesCalendar</code> dates dimension to all the corresponding dates in the other tables: 
<img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/03-Calendar-Table-in-DAX-asset-2-Untitled.png" alt=""></p>

</details>
</li>
</ol>

<h2 id="create-a-visual-that-shows-the-amount-in--that-is-about-to-expire-per-month-week-day--weekday">Create a visual that shows the amount in $ that is about to expire per Month, Week, Day &amp; Weekday</h2>

<ol>
<li>
<p>Insert a matrix visual: add the total product price that is about to expire for each period: Month, Week, Weekday and Day</p>
</li>
<li>
<p>Format the matrix to add data bars to that we can visually compare the weeks. You should see something like this:</p>

<p><img src="https://wagon-public-assets.s3.eu-west-3.amazonaws.com/05-Dashboarding/05-Power-BI-2/03-Calendar-Table-in-DAX-asset-3-Untitled.png" alt=""></p>
</li>
</ol>



</div>
</div>