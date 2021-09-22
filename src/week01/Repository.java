package week01;

import java.util.ArrayList;

public class Repository {
    private ArrayList<Good> repo;

    public Repository(ArrayList<Good> repo) {
        super();
        this.repo = repo;
    }

    @Override
    public String toString() {
        return "Repository [repo=" + repo + "]";
    }

    public Repository() {
        super();
        // TODO Auto-generated constructor stub
    }

    public ArrayList<Good> getRepo() {
        return repo;
    }

    public void setRepo(ArrayList<Good> repo) {
        this.repo = repo;
    }

}
