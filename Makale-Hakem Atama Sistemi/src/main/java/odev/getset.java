package odev;

public class getset {
	//editor
	private String editorka;
	private String editorsf;
	private String editoradsoyad;
	private String editormail;
	
	public String geteditorka()
	{
		return editorka;	
	}
	public void seteditorka(String editorka) {
		this.editorka = editorka;
	}
	
	public String geteditorsf()
	{
		return editorsf;	
	}
	
	public void seteditorsf(String editorsf) {
		this.editorsf = editorsf;
	}
	public String geteditoradsoyad()
	{
		return editoradsoyad;	
	}
	public void seteditoradsoyad(String editoradsoyad) {
		this.editoradsoyad = editoradsoyad;
	}
	public String geteditormail()
	{
		return editormail;	
	}
	public void seteditormail(String editormail) {
		this.editormail = editormail;
	}
	
	//yazar
	
	private String yazarka;
	private String yazarsf;
	private String yazarmail;
	private String tarihh;
	
	public String getTarihh() {
		return tarihh;
	}
	public void setTarihh(String tarihh) {
		this.tarihh = tarihh;
	}
	public String getyazarka()
	{
		return yazarka;	
	}
	public void setyazarka(String yazarka) {
		this.yazarka = yazarka;
	}
	public String getyazarsf()
	{
		return yazarsf;	
	}
	public void setyazarsf(String yazarsf) {
		this.yazarsf = yazarsf;
	}
	public String getyazarmail()
	{
		return yazarmail;	
	}
	public void setyazarmail(String yazarmail) {
		this.yazarmail = yazarmail;
	}
	
	
	//hoca
	
	private String hocaka;
	private String hocasf;
	private String hocaadsoyad;
	private String puan;
	private String hocamail;
	private String pozisyon;
	private String hocatel;
	private String tarih;
	private int turid;
	
	public String gethocaka()
	{
		return hocaka;	
	}
	public void sethocaka(String hocaka) {
		this.hocaka = hocaka;
	}
	
	public String gettarih()
	{
		return tarih;	
	}
	public void settarih(String tarih) {
		this.tarih = tarih;
	}
	public String gethocasf()
	{
		return hocasf;	
	}
	public void sethocasf(String hocasf) {
		this.hocasf = hocasf;
	}
	
	public String gethocaadsoyad()
	{
		return hocaadsoyad;	
	}
	public void sethocaadsoyad(String hocaadsoyad) {
		this.hocaadsoyad = hocaadsoyad;
	}
	
	public String getpuan()
	{
		return puan;	
	}
	public void setpuan(String puan) {
		this.puan = puan;
	}
	
	public String gethocamail()
	{
		return hocamail;	
	}
	public void sethocamail(String hocamail) {
		this.hocamail = hocamail;
	}
	
	public String getpozisyon()
	{
		return pozisyon;	
	}
	public void setpozisyon(String pozisyon) {
		this.pozisyon = pozisyon;
	}
	
	
	public String gethocatel()
	{
		return hocatel;	
	}
	public void sethocatel(String hocatel) {
		this.hocatel = hocatel;
	}
	
	public int getturid() {
		return turid;
	}
	public void setturid(int turid) {
		this.turid= turid;
	}
	
	
	// tur 
	private int idtur;
	private String turadi;
	public String getturadi()
	{
		return turadi;	
	}
	public void setturadi(String turadi) {
		this.turadi = turadi;
	}
	
	public int getidtur() {
		return turid;
	}
	public void setidtur(int idtur) {
		this.idtur= idtur;
	}
	
	
	
	//makale 
	private String makaleBaslik;
	private String makaleicerik;
	private String makaletarih;
	private String yazaradsoyad;
	private int yazarid;
    private int idTur;
    private String durum;
	
	public String getDurum() {
		return durum;
	}
	public void setDurum(String durum) {
		this.durum = durum;
	}
	public String getmakaleBaslik()
	{
		return makaleBaslik;	
	}
	public void setmakaleBaslik(String makaleBaslik) {
		this.makaleBaslik = makaleBaslik;
	}
	
	public String getyazaradsoyad()
	{
		return yazaradsoyad;	
	}
	public void setyazaradsoyad(String yazaradsoyad) {
		this.yazaradsoyad = yazaradsoyad;
	}
	
	
	public String getmakaleicerik()
	{
		return makaleicerik;	
	}
	public void setmakaleicerik(String makaleicerik) {
		this.makaleicerik = makaleicerik;
	}
	
	
	
	public String getmakaletarih()
	{
		return makaletarih;	
	}
	public void setmakaletarih(String makaletarih) {
		this.makaletarih = makaletarih;
	}
	
	public int getyazarid()
	{
		return yazarid;	
	}
	public void setyazarid(int yazarid) {
		this.yazarid = yazarid;
	}
	

	public int getidTur()
	{
		return idTur;	
	}
	public void setidTur(int idTur) {
		this.idTur = idTur;
	}
	
	//atananmakale
	private int hocaid;
	private int makaleid;
	private String onay;
	private String tarihmakale;

	public int getHocaid() {
		return hocaid;
	}
	public void setHocaid(int hocaid) {
		this.hocaid = hocaid;
	}
	public int getMakaleid() {
		return makaleid;
	}
	public void setMakaleid(int makaleid) {
		this.makaleid = makaleid;
	}
	public String getOnay() {
		return onay;
	}
	public void setOnay(String onay) {
		this.onay = onay;
	}
	public String getTarihmakale() {
		return tarihmakale;
	}
	public void setTarihmakale(String tarihmakale) {
		this.tarihmakale = tarihmakale;
	}
	
	

}
