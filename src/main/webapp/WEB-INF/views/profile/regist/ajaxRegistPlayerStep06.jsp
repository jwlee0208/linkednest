<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<h3>Statistics</h3>
<hr />
<h3>
	<small>Pitching Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="pTeamName_pitch_stat" name="pitch_stat_pTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="pStatYear_pitch_stat" name="pitch_stat_pStatYear"/>
	</div>
	<label class="col-1 col-form-label">INN</label>
	<div class="col-2">
		<input type="number" class="form-control" id="inn_pitch_stat" name="pitch_stat_inn" value="0.0" />
	</div>
	<label class="col-1 col-form-label">W</label>
	<div class="col-2">
		<input type="number" class="form-control" id="w_pitch_stat" name="pitch_stat_w" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">L</label>
	<div class="col-2">
		<input type="number" class="form-control" id="l_pitch_stat" name="pitch_stat_l" value="0" />
	</div>
	<label class="col-1 col-form-label">ERA</label>
	<div class="col-2">
		<input type="number" class="form-control" id="era_pitch_stat" name="pitch_stat_era" value="0.0" />
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_pitch_stat" name="pitch_stat_g" value="0" />
	</div>
	<label class="col-1 col-form-label">GS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="gs_pitch_stat" name="pitch_stat_gs" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SV</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sv_pitch_stat" name="pitch_stat_sv" value="0" />
	</div>
	<label class="col-1 col-form-label">SVO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="svo_pitch_stat" name="pitch_stat_svo" value="0" />
	</div>
	<label class="col-1 col-form-label">IP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ip_pitch_stat" name="pitch_stat_ip" value="0.0" />
	</div>
	<label class="col-1 col-form-label">H</label>
	<div class="col-2">
		<input type="number" class="form-control" id="h_pitch_stat" name="pitch_stat_h" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">R</label>
	<div class="col-2">
		<input type="number" class="form-control" id="r_pitch_stat" name="pitch_stat_r" value="0" />
	</div>
	<label class="col-1 col-form-label">ER</label>
	<div class="col-2">
		<input type="number" class="form-control" id="er_pitch_stat" name="pitch_stat_er" value="0" />
	</div>
	<label class="col-1 col-form-label">HR</label>
	<div class="col-2">
		<input type="number" class="form-control" id="hr_pitch_stat" name="pitch_stat_hr" value="0" />
	</div>
	<label class="col-1 col-form-label">BB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="bb_pitch_stat" name="pitch_stat_bb" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="so_pitch_stat" name="pitch_stat_so" value="0" />
	</div>
	<label class="col-1 col-form-label">AVG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="avg_pitch_stat" name="pitch_stat_avg" value="0.0" />
	</div>
	<label class="col-1 col-form-label">WHIP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="whip_pitch_stat" name="pitch_stat_whip" value="0.0" />
	</div>
	<label class="col-1 col-form-label">K</label>
	<div class="col-2">
		<input type="number" class="form-control" id="k_pitch_stat" name="pitch_stat_k" value="0" />
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addPitcherBtn btn-block" value="Add Pitching Stat(+)" />
</div>
<table class="table tablePitcherStat">
	<thead class="">
	<tr>
		<th>Team</th>
		<th>Year</th>
		<th>INN</th>
		<th>W</th>
		<th>L</th>
		<th>ERA</th>
		<th>G</th>
		<th>GS</th>
		<th>SV</th>
		<th>SVO</th>
		<th>IP</th>
		<th>H</th>
		<th>R</th>
		<th>ER</th>
		<th>HR</th>
		<th>BB</th>
		<th>SO</th>
		<th>AVG</th>
		<th>WHIP</th>
		<th>K</th>
		<th>DEL</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br />
<h3>
	<small>Hitting Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="hTeamName_hit_stat" name="hit_stat_hTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="hStatYear_hit_stat" name="hit_stat_hStatYear" />
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_hit_stat" name="hit_stat_g" value="0" />
	</div>
	<label class="col-1 col-form-label">AB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ab_hit_stat" name="hit_stat_ab" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">R</label>
	<div class="col-2">
		<input type="number" class="form-control" id="r_hit_stat" name="hit_stat_r" value="0" />
	</div>
	<label class="col-1 col-form-label">H</label>
	<div class="col-2">
		<input type="number" class="form-control" id="h_hit_stat" name="hit_stat_h" value="0" />
	</div>
	<label class="col-1 col-form-label">2B</label>
	<div class="col-2">
		<input type="number" class="form-control" id="twoB_hit_stat" name="hit_stat_twoB" value="0" />
	</div>
	<label class="col-1 col-form-label">3B</label>
	<div class="col-2">
		<input type="number" class="form-control" id="threeB_hit_stat" name="hit_stat_threeB" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">HR</label>
	<div class="col-2">
		<input type="number" class="form-control" id="hr_hit_stat" name="hit_stat_hr" value="0" />
	</div>
	<label class="col-1 col-form-label">RBI</label>
	<div class="col-2">
		<input type="number" class="form-control" id="rbi_hit_stat" name="hit_stat_rbi" value="0" />
	</div>
	<label class="col-1 col-form-label">BB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="bb_hit_stat" name="hit_stat_bb" value="0" />
	</div>
	<label class="col-1 col-form-label">SO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="so_hit_stat" name="hit_stat_so" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sb_hit_stat" name="hit_stat_sb" value="0" />
	</div>
	<label class="col-1 col-form-label">CS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cs_hit_stat" name="hit_stat_cs" value="0" />
	</div>
	<label class="col-1 col-form-label">AVG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="avg_hit_stat" name="hit_stat_avg" value="0.0" />
	</div>

	<label class="col-1 col-form-label">OBP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="obp_hit_stat" name="hit_stat_obp" value="0.0" />
	</div>

</div>
<div class="form-group row">
	<label class="col-1 col-form-label">SLG</label>
	<div class="col-2">
		<input type="number" class="form-control" id="slg_hit_stat" name="hit_stat_slg" value="0.0" />
	</div>
	<label class="col-1 col-form-label">OPS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="ops_hit_stat" name="hit_stat_ops" value="0.0" />
	</div>
	<div class="col-6"></div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addHitterBtn btn-block" value="Add Hitting Stat(+)" />
</div>
<table class="table tableHitterStat">
	<thead class="">
	<tr>
		<th>Team</th>
		<th>Year</th>
		<th>G</th>
		<th>AB</th>
		<th>R</th>
		<th>H</th>
		<th>2B</th>
		<th>3B</th>
		<th>HR</th>
		<th>RBI</th>
		<th>BB</th>
		<th>SO</th>
		<th>SB</th>
		<th>CS</th>
		<th>AVG</th>
		<th>OBP</th>
		<th>SLG</th>
		<th>OPS</th>
		<th>Add</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
<br/>
<h3>
	<small>Fielding Stat</small>
</h3>
<div class="form-group row">
	<label class="col-1 col-form-label">Team Name</label>
	<div class="col-2">
		<input type="text" class="form-control" id="fTeamName_field_stat" name="field_stat_fTeamName" />
	</div>
	<label class="col-1 col-form-label">Year</label>
	<div class="col-2">
		<input type="month" class="form-control" id="fStatYear_field_stat" name="field_stat_fStatYear"/>
	</div>
	<label class="col-1 col-form-label">POS</label>
	<div class="col-2">
		<select id="pos_field_stat" name="field_stat_pos" class="form-control">
			<option value="">::: select position :::</option>
			<option value="P">Pitcher</option>
			<option value="C">Catcher</option>
			<option value="1B">1st Base</option>
			<option value="2B">2nd Base</option>
			<option value="3B">3rd Base</option>
			<option value="SS">Short Stop</option>
			<option value="LF">Left Fielder</option>
			<option value="CF">Center Fielder</option>
			<option value="RF">Right Fielder</option>
			<option value="DH">DH</option>
		</select>
	</div>
	<label class="col-1 col-form-label">G</label>
	<div class="col-2">
		<input type="number" class="form-control" id="g_field_stat" name="field_stat_g" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">GS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="gs_field_stat" name="field_stat_gs" value="0" />
	</div>
	<label class="col-1 col-form-label">INN</label>
	<div class="col-2">
		<input type="number" class="form-control" id="inn_field_stat" name="field_stat_inn" value="0.0" />
	</div>
	<label class="col-1 col-form-label">TC</label>
	<div class="col-2">
		<input type="number" class="form-control" id="tc_field_stat" name="field_stat_tc" value="0" />
	</div>
	<label class="col-1 col-form-label">PO</label>
	<div class="col-2">
		<input type="number" class="form-control" id="po_field_stat" name="field_stat_po" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">A</label>
	<div class="col-2">
		<input type="number" class="form-control" id="a_field_stat" name="field_stat_a" value="0" />
	</div>
	<label class="col-1 col-form-label">E</label>
	<div class="col-2">
		<input type="number" class="form-control" id="e_field_stat" name="field_stat_e" value="0" />
	</div>

	<label class="col-1 col-form-label">DP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="dp_field_stat" name="field_stat_dp" value="0" />
	</div>
	<label class="col-1 col-form-label">SB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sb_field_stat" name="field_stat_sb" value="0" />
	</div>
</div>

<div class="form-group row">
	<label class="col-1 col-form-label">CS</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cs_field_stat" name="field_stat_cs" value="0" />
	</div>
	<label class="col-1 col-form-label">SBPCT</label>
	<div class="col-2">
		<input type="number" class="form-control" id="sbpct_field_stat" name="field_stat_sbpct" value="0" />
	</div>

	<label class="col-1 col-form-label">PB</label>
	<div class="col-2">
		<input type="number" class="form-control" id="pb_field_stat" name="field_stat_pb" value="0" />
	</div>
	<label class="col-1 col-form-label">cWP</label>
	<div class="col-2">
		<input type="number" class="form-control" id="cwp_field_stat" name="field_stat_cwp" value="0" />
	</div>
</div>
<div class="form-group row">
	<label class="col-1 col-form-label">FPCT</label>
	<div class="col-2">
		<input type="number" class="form-control" id="fpct_field_stat" name="field_stat_fpct" value="0.0" />
	</div>
	<label class="col-1 col-form-label">RF</label>
	<div class="col-2">
		<input type="number" class="form-control" id="rf_field_stat" name="field_stat_rf" value="0.0" />
	</div>
	<div class="col-6">
	</div>
</div>
<div class="form-group row">
	<input type="button" class="btn btn-outline-primary addFielderBtn btn-block" value="Add Fielding Stat(+)" />
</div>

<table class="table tableFielderStat">
	<thead class="">
	<tr>
		<th>Team</th><th>Year</th><th>Position</th><th>G</th><th>GS</th><th>INN</th><th>TC</th><th>PO</th><th>A</th><th>E</th>
		<th>DP</th><th>SB</th><th>CS</th><th>SBPCT</th><th>PB</th><th>C_WP</th><th>FPCT</th><th>PRF</th><th>Add</th>
	</tr>
	</thead>
	<tbody>
	</tbody>
</table>
