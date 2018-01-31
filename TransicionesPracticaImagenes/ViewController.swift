//
//  ViewController.swift
//  TransicionesPracticaImagenes
//
//  Created by Maestro on 29/01/18.
//  Copyright © 2018 Maestro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var vwContenedor: UIView!
    @IBOutlet weak var btnSi: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    @IBOutlet weak var imgContenedor: UIImageView!
    @IBOutlet weak var lblPregunta: UILabel!
    
    var preguntas : [Pregunta] = []
    var respuesta : Bool = false
    var numPregunta : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preguntas.append(Pregunta(imagen: UIImage(named : "baseball")!, pregunta: "¿Es una pelota de beisbol", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "basquetbol")!, pregunta: "¿Es una pelota de basquetbol?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "corazon")!, pregunta: "¿Es un corazon?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "futbol")!, pregunta: "¿Es una pelota de futbol?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "futbolAmericano")!, pregunta: "¿Es una pelota de futbol americano?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "hombre")!, pregunta: "¿Es un hombre?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "limon")!, pregunta: "¿Es un limon?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "manzana")!, pregunta: "¿Es una manzana?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "mujer")!, pregunta: "¿Es una mujer?", respuesta: true))
        preguntas.append(Pregunta(imagen: UIImage(named : "naranja")!, pregunta: "¿Es una naranja?", respuesta: true))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblPregunta.text = preguntas[0].pregunta
        self.imgContenedor.image = preguntas[0].imagen
    }
    
    func checarRespuesta()
    {
        UIView.transition(with: vwContenedor, duration: 0.5, options: [.transitionFlipFromLeft], animations: {
            if(self.respuesta == self.preguntas[self.numPregunta].respuesta)
            {
                self.imgContenedor.image = UIImage(named: "correcto")
                self.lblPregunta.text = "Correcto"
                self.btnNo.isHidden = true
                self.btnSi.isHidden = true
                
            } else {
                self.imgContenedor.image = UIImage(named: "incorrecto")
                self.lblPregunta.text = "Incorrecto"
                self.btnNo.isHidden = true
                self.btnSi.isHidden = true
            }
        }, completion: { _ in
            UIView.animate(withDuration: 1.5, animations: {
                self.imgContenedor.center.x += 1
            }, completion: { _ in
                UIView.transition(with: self.vwContenedor, duration: 0.5, options: [.transitionFlipFromTop], animations: {
                    
                    self.numPregunta += 1
                    if(self.numPregunta >= self.preguntas.count - 1){
                        self.numPregunta = self.preguntas.count - 1
                    }
                    self.lblPregunta.text = self.preguntas[self.numPregunta].pregunta
                    self.imgContenedor.image = self.preguntas[self.numPregunta].imagen
                    self.btnNo.isHidden = false
                    self.btnSi.isHidden = false
                }, completion: nil)
            })
        })
    }
    
    @IBAction func btnNo(_ sender: Any)
    {
        respuesta = false
        checarRespuesta()
    }
    
    @IBAction func btnSi(_ sender: Any)
    {
        respuesta = true
        checarRespuesta()
    }
}

