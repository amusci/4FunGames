using UnityEngine.SceneManagement;
using UnityEngine;

public class FinishLineForLevel1 : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }


    void OnCollisionEnter2D(Collision2D other)
    {
        if (other.gameObject.CompareTag("Player"))
        {

            SceneManager.LoadScene("level2");
            
        }
        
    }
}