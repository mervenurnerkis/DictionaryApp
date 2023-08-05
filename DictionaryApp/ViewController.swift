//
//  ViewController.swift
//  DictionaryApp
//
//  Created by Merve Nur Nerkis on 4.08.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var wordTableView: UITableView!
    
    var kelimeListesi = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabaniKopyala()
                
        
        wordTableView.delegate = self
        wordTableView.dataSource = self
        searchBar.delegate = self
        
        kelimeListesi = Kelimelerdao().tumKelimeAl()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        
        let gidilecekVC = segue.destination as! WordDetailViewController
        
        gidilecekVC.kelime = kelimeListesi[indeks!]
    }
    
    func veritabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı zaten var")
        }else {
            do {
                
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch {
                print(error)
            }
        }
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kelime = kelimeListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "wordCell", for: indexPath) as! WordCellTableViewCell
        
        hucre.englishLabel.text = kelime.ingilizce
        hucre.turkishLabel.text = kelime.turkce
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toWordDetail", sender: indexPath.row)
        
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama Sonucu: \(searchText)")
        
        kelimeListesi =  Kelimelerdao().aramaYap(ingilizce: searchText)
        
        wordTableView.reloadData()
    }
}

