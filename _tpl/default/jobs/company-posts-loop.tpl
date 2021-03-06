

{if $no_categ != 1}
	{if $keywords}
		<div class="listing-headline">{$translations.searchbar.search_results_for} <span class="searched">{$keywords}</span> : </div>
	{/if}
	{if $jobs}

		<ul class="listings-block">
		{foreach item=job from=$jobs name='jobsLoop'}

			<!-- Adsense plugin -->
			{if $smarty.const.ADSENSE == 'true'}
				{if $smarty.foreach.jobsLoop.iteration is div by $smarty.const.ADSENSE_LISTING_COUNT} 
				{include file="$adsense_listing_leaderboard"}
				{/if}
			{/if}

			<li class="company-jobs-li {if $job.spotlight == "1"}spotlight{/if} {if $related == 1}related-padding{/if}" >

				<!-- MOBILE CONTENT LISTING -->
				<div class="mobile-listing-content">

						<a href="/{$URL_JOB}/{$job.id}/{$job.url_title}" >
							<div class="listing-title ml0">
								{$job.title} {if $job.new_flag}<span class="new">{$translations.job_detail_section.new}</span>{/if}
							</div>
						</a>

						<div class="listing-info ml0">
							<i class="fa fa-building list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.company}</span> |&nbsp;
							{if $REMOTE_PORTAL == 'deactivated'}
							<i class="fa fa-map-marker list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.location_asci}</span> |&nbsp;
							{/if}
							<i class="fa fa-calendar list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.created_on}</span>
						</div>

						<div class="listing-type" >
							<span class="list-{$job.type_var_name}">{$job.job_type}</span>
						</div>

						{if $job.salary}
						<div class="listing-type mt20" >
							<span class="list-salary">{$job.salary}</span>
						</div>
						{/if}

						<div class="listing-type mt20" >
							{if $job.id|in_array:$favourites_job_ids}
				 				<div id="mob-favourites-block-{$job.id}" class="center-favourite" ><a title="{$translations.alljobs.favourites_tooltip_remove}" href="#" onclick="return SimpleJobScript.removeFromFavourites({$job.id}, '{$BASE_URL}_tpl/{$THEME}/img/', 'mob-');"><i class="fa fa-heart fa-lg ml10" aria-hidden="true"></i></a></div>
				 	 		{else}
				 	 			<div id="mob-favourites-block-{$job.id}" class="center-favourite" ><a title="{$translations.alljobs.favourites_tooltip_add}" href="#" onclick="return SimpleJobScript.addToFavourites({$job.id}, '{$BASE_URL}_tpl/{$THEME}/img/', 'mob-');"><i class="fa fa-heart-o fa-lg ml10" aria-hidden="true"></i></a></div>
				 	 		{/if}
			 	 		</div>

			 	 		<div class="noMP col-md-12 col-sm-12 col-xs-12">
		 	 		 		<a href="/{$URL_JOB}/{$job.id}/{$job.url_title}" >
				 				<div class="listing-desc" >
					 				{$job.description_listing}
					 			</div>
					 		</a>
						</div>
				</div>
				<!-- ################################################### -->

				<!-- DESKTOP CONTENT LISTING -->
		 		<div class="desktop-listing-content">

		 		<div class="noMP col-md-7 col-sm-7 col-xs-7">

					<a href="/{$URL_JOB}/{$job.id}/{$job.url_title}" >
						<div class="listing-title ml0">
							{$job.title} {if $job.new_flag}<span class="new">{$translations.job_detail_section.new}</span>{/if}
						</div>
					</a>

					<div class="listing-info ml0">
						<i class="fa fa-building list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.company}</span>|&nbsp;
						{if $REMOTE_PORTAL == 'deactivated'}
						<i class="fa fa-map-marker list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.location_asci}</span>|&nbsp;
						{/if}
						<i class="fa fa-calendar list-fa fa-lg" aria-hidden="true"></i><span class="opaque">{$job.created_on}</span>
					</div>

		 		</div>

		 		<div class="noMP col-md-5 col-sm-5 col-xs-5" >
					<div class="listing-type" >
						<span class="list-{$job.type_var_name}">{$job.job_type}</span>&nbsp;&nbsp;{if $job.salary}<span class="list-salary">{$job.salary}</span>{/if}

						{if $job.id|in_array:$favourites_job_ids}
			 				<span id="desk-favourites-block-{$job.id}" ><a title="{$translations.alljobs.favourites_tooltip_remove}" href="#" onclick="return SimpleJobScript.removeFromFavourites({$job.id}, '{$BASE_URL}_tpl/{$THEME}/img/', 'desk-');"><i class="fa fa-heart fa-lg ml10" aria-hidden="true"></i></a></span>
			 	 		{else}
			 	 			<span id="desk-favourites-block-{$job.id}" ><a title="{$translations.alljobs.favourites_tooltip_add}" href="#" onclick="return SimpleJobScript.addToFavourites({$job.id}, '{$BASE_URL}_tpl/{$THEME}/img/', 'desk-');"><i class="fa fa-heart-o fa-lg ml10" aria-hidden="true"></i></a></span>
			 	 		{/if}
					</div>
		 		</div>

	 				<div class="noMP col-md-12 col-sm-12 col-xs-12">
	 	 		 		<a href="/{$URL_JOB}/{$job.id}/{$job.url_title}" >
			 				<div class="listing-desc" >
				 				{$job.description_listing}
				 			</div>
				 		</a>
					</div>

				</div>

			</li>
		{/foreach}
		</ul>

		{if $pages}
		<div class="pagination">
		<ul>
			{$pages}
		</ul>
		</div>
		<br />
		{/if}		

	{else}
		<div id="no-ads">
			{if $CURRENT_PAGE != 'search'}
				{$translations.jobs.no_job} <strong>{$current_category_name}</strong>.
				{if $smarty.const.ENABLE_NEW_JOBS}
					<br /><a href="{$BASE_URL}post/" title="{$translations.footer.new_job_title}">{$translations.footer.new_job}</a>
				{/if}
			{else}
				{$translations.jobs.no_job_found}<br /> <br /> <br />
			{/if}
		</div><!-- #no-ads -->
	{/if}
{/if}